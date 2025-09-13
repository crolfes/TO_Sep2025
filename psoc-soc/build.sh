#/bin/bash
set -e

echo "====================> Setting up proper ORFS version =================================="
SYSTEM_ORFS_REV=$(cat $TOOLS/openroad-latest/ORFS_COMMIT)
REPO_ORFS_REV=$(cat src/ORFS_COMMIT)

if [ "$SYSTEM_ORFS_REV" != "$REPO_ORFS_REV" ]; then
    echo "Error: Repo ORFS revision ($REPO_ORFS_REV) does not match system ORFS revision ($SYSTEM_ORFS_REV)"
    echo "Refusing to build with wrong ORFS revision."
    exit 1
fi

rm -rf orfs
git clone --quiet --filter=blob:none https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git orfs
pushd orfs
git checkout $REPO_ORFS_REV
popd

echo ""
echo "============================> Setting up ORFS ========================================="
export YOSYS_EXE=$TOOLS/yosys/bin/yosys
export OPENROAD_EXE=$TOOLS/openroad-latest/bin/openroad
export OPENSTA_EXE=$TOOLS/openroad-latest/bin/sta
export FLOW_HOME=$PWD/orfs/flow
pushd src
make clean

echo ""
echo "============================> VHDL => Verilog ========================================="
make sg13g2_wrap

echo ""
echo "==========================> Generating Sealring ======================================="
make sg13g2_sealring

echo ""
echo "=================================> RTL2GDS ============================================"
make sg13g2

echo ""
echo "===============================> Final Fills =========================================="
make sg13g2_fill

echo ""
echo "===============================> Zipping GDS =========================================="
rm -v ../design_data/gds/FMD_QNC_final_layout.gds.zip
zip -j ../design_data/gds/FMD_QNC_final_layout.gds.zip "$FLOW_HOME/results/ihp-sg13g2/soc_top/base/7_filled.gds"

echo ""
echo "================================> Quick DRC ==========================================="
make sg13g2_drc
cp "$FLOW_HOME/results/ihp-sg13g2/soc_top/base/8_drc_sg13g2_minimal.lyrdb" ../

echo ""
echo "==============================> Submission DRC ========================================"
klayout -b -r ../../drc/drc.lydrc -rd "in_gds"="$FLOW_HOME/results/ihp-sg13g2/soc_top/base/7_filled.gds" -rd "report_file"="../submission.drc.lyrdb"
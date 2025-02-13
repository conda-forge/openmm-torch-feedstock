import os
import subprocess
import sys

# Change to the tests directory
os.chdir(os.path.join(os.environ["CONDA_PREFIX"], "share", "openmmtorch", "tests"))

# List directory contents (equivalent to ls -al)
print(subprocess.check_output(["ls", "-al"]).decode())

summary = ""
exitcode = 0

# Iterate through test files
for f in os.listdir("."):
    if f.startswith("Test"):
        # Skip CUDA and OpenCL tests
        if "Cuda" in f or "OpenCL" in f:
            continue

        print(f"Running {f}...")

        # Run the test and capture return code
        result = subprocess.run(f"./{f}", shell=True)
        thisexitcode = result.returncode

        # Build summary string
        summary += f"\n{f}: {'OK' if thisexitcode == 0 else 'FAILED'}"
        exitcode += thisexitcode

# Print summary
print("-------")
print("Summary")
print("-------")
print(summary)

sys.exit(exitcode)

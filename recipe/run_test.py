import os
import subprocess
import sys

# Change to the tests directory
os.chdir(os.path.join(os.environ["CONDA_PREFIX"], "share", "openmm-torch", "tests"))

# List directory contents
files = os.listdir(".")
print(files)

summary = ""
exitcode = 0

# Iterate through test files
for ff in files:
    if ff.startswith("Test"):
        # Skip CUDA and OpenCL tests
        if "Cuda" in ff or "OpenCL" in ff:
            continue

        print(f"Running {ff}...")

        # Run the test and capture return code
        result = subprocess.run(f"./{ff}", shell=True, capture_output=True)
        thisexitcode = result.returncode

        # Print stdout and stderr if process failed
        if thisexitcode != 0:
            if result.stdout:
                print("STDOUT:")
                print(result.stdout)
            if result.stderr:
                print("STDERR:")
                print(result.stderr)

        # Build summary string
        summary += f"\n{ff}: {'OK' if thisexitcode == 0 else 'FAILED'}"
        exitcode += thisexitcode

# Print summary
print("-------\nSummary\n-------")
print(summary)

sys.exit(exitcode)

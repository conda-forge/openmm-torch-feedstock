About openmm-torch-feedstock
============================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/openmm-torch-feedstock/blob/main/LICENSE.txt)

Home: https://github.com/openmm/openmm-torch

Package license: MIT

Summary: OpenMM plugin to define forces with neural networks

Development: https://github.com/openmm/openmm-torch

Documentation: https://github.com/openmm/openmm-torch

This is a plugin for OpenMM that allows neural networks to be
used for defining forces. It is implemented with PyTorch.
To use it, you create a PyTorch model that takes particle
positions as input and produces energy as output. This plugin
uses the model to apply forces to particles during a simulation.


Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
            <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64_c_compiler_version10cuda_compilernvcccuda_compiler_version11.2cxx_compiler_version10python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version10cuda_compilernvcccuda_compiler_version11.2cxx_compiler_version10python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version10cuda_compilernvcccuda_compiler_version11.2cxx_compiler_version10python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version10cuda_compilernvcccuda_compiler_version11.2cxx_compiler_version10python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version10cuda_compilernvcccuda_compiler_version11.2cxx_compiler_version10python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version10cuda_compilernvcccuda_compiler_version11.2cxx_compiler_version10python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version10cuda_compilernvcccuda_compiler_version11.2cxx_compiler_version10python3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version10cuda_compilernvcccuda_compiler_version11.2cxx_compiler_version10python3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version10cuda_compilernvcccuda_compiler_version11.2cxx_compiler_version10python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version10cuda_compilernvcccuda_compiler_version11.2cxx_compiler_version10python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version11cuda_compilernvcccuda_compiler_version11.8cxx_compiler_version11python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version11cuda_compilernvcccuda_compiler_version11.8cxx_compiler_version11python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version11cuda_compilernvcccuda_compiler_version11.8cxx_compiler_version11python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version11cuda_compilernvcccuda_compiler_version11.8cxx_compiler_version11python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version11cuda_compilernvcccuda_compiler_version11.8cxx_compiler_version11python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version11cuda_compilernvcccuda_compiler_version11.8cxx_compiler_version11python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version11cuda_compilernvcccuda_compiler_version11.8cxx_compiler_version11python3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version11cuda_compilernvcccuda_compiler_version11.8cxx_compiler_version11python3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version11cuda_compilernvcccuda_compiler_version11.8cxx_compiler_version11python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version11cuda_compilernvcccuda_compiler_version11.8cxx_compiler_version11python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version12cuda_compilercuda-nvcccuda_compiler_version12.0cxx_compiler_version12python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version12cuda_compilercuda-nvcccuda_compiler_version12.0cxx_compiler_version12python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version12cuda_compilercuda-nvcccuda_compiler_version12.0cxx_compiler_version12python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version12cuda_compilercuda-nvcccuda_compiler_version12.0cxx_compiler_version12python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version12cuda_compilercuda-nvcccuda_compiler_version12.0cxx_compiler_version12python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version12cuda_compilercuda-nvcccuda_compiler_version12.0cxx_compiler_version12python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version12cuda_compilercuda-nvcccuda_compiler_version12.0cxx_compiler_version12python3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version12cuda_compilercuda-nvcccuda_compiler_version12.0cxx_compiler_version12python3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_c_compiler_version12cuda_compilercuda-nvcccuda_compiler_version12.0cxx_compiler_version12python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_c_compiler_version12cuda_compilercuda-nvcccuda_compiler_version12.0cxx_compiler_version12python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_c_compiler_version12cuda_compilerNonecuda_compiler_versionNonecxx_compiler_version12python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64_python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64_python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64_python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64_python3.8.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_python3.8.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64_python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=11624&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/openmm-torch-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-openmm--torch-green.svg)](https://anaconda.org/conda-forge/openmm-torch) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/openmm-torch.svg)](https://anaconda.org/conda-forge/openmm-torch) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/openmm-torch.svg)](https://anaconda.org/conda-forge/openmm-torch) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/openmm-torch.svg)](https://anaconda.org/conda-forge/openmm-torch) |

Installing openmm-torch
=======================

Installing `openmm-torch` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Once the `conda-forge` channel has been enabled, `openmm-torch` can be installed with `conda`:

```
conda install openmm-torch
```

or with `mamba`:

```
mamba install openmm-torch
```

It is possible to list all of the versions of `openmm-torch` available on your platform with `conda`:

```
conda search openmm-torch --channel conda-forge
```

or with `mamba`:

```
mamba search openmm-torch --channel conda-forge
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search openmm-torch --channel conda-forge

# List packages depending on `openmm-torch`:
mamba repoquery whoneeds openmm-torch --channel conda-forge

# List dependencies of `openmm-torch`:
mamba repoquery depends openmm-torch --channel conda-forge
```


About conda-forge
=================

[![Powered by
NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](https://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[Azure](https://azure.microsoft.com/en-us/services/devops/), [GitHub](https://github.com/),
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/),
[Drone](https://cloud.drone.io/welcome), and [TravisCI](https://travis-ci.com/)
it is possible to build and upload installable packages to the
[conda-forge](https://anaconda.org/conda-forge) [anaconda.org](https://anaconda.org/)
channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating openmm-torch-feedstock
===============================

If you would like to improve the openmm-torch recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/openmm-torch-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@RaulPPelaez](https://github.com/RaulPPelaez/)
* [@jaimergp](https://github.com/jaimergp/)
* [@mikemhenry](https://github.com/mikemhenry/)
* [@peastman](https://github.com/peastman/)
* [@raimis](https://github.com/raimis/)


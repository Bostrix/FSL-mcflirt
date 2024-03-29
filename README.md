# McFlirt Library - Compilation and Usage Guide

## Introduction
Welcome to the McFlirt library, a tool designed for motion correction of fMRI (functional Magnetic Resonance Imaging) data. This guide will walk you through the process of compiling the McFlirt library and utilizing its functionalities to generate motion-corrected fMRI datasets.

## Clone the Repository
Begin by cloning the project repository from GitHub onto your local machine. You can do this by running the following command in your terminal or command prompt:
```bash
https://github.com/Bostrix/FSL-mcflirt.git
```
This command will create a local copy of the project in a directory named "FSL-mcflirt".

## Navigate to Project Directory
Change your current directory to the newly cloned project directory using the following command:
```bash
cd FSL-mcflirt
```
## Compilation
To compile the McFlirt library, follow these steps:
- Install Required Libraries:
    Ensure that all necessary libraries, such as `Blas`,`Lapack`,`zlib`, are installed on your system. Use the following command to install those:
```bash
sudo apt-get install libblas-dev libblas3
sudo apt-get install liblapack-dev liblapack3
sudo apt-get install zlib1g zlib1g-dev
```

- Modfication of the Makefile:
  After installing the necessary tools, modify the makefile to include additional LDFLAGS for the required libraries. For example, if using zlib, add the following line to the makefile:
```bash
ZNZLIB_LDFLAGS = -L/path/to/your/znzlib/directory -lfsl-znz
```
Replace `Path to your znzlib directory` with actual path to your directory.Then, make sure that `$(ZNZLIB_LDFLAGS)` is added in the compile step of the makefile.

- Compile Source Code:
    Execute the appropriate compile command to build the McFlirt library. For example:
```bash
make clean
make
```
This command will compile the source code and generate the executable file for McFlirt.

- Resolving Shared Library Errors:
When running an executable on Linux, you may encounter errors related to missing shared libraries.This typically manifests as messages like:
```bash
./mcflirt: error while loading shared libraries: libexample.so: cannot open shared object file:No such file or directory
```
To resolve these errors,Pay attention to the names of the missing libraries mentioned in the error message.Locate the missing libraries on your system. If they are not present, you may need to install the corresponding packages.If the libraries are installed in custom directories, you need to specify those directories using the `LD_LIBRARY_PATH` environment variable. For example:
```bash
export LD_LIBRARY_PATH=/path/to/custom/libraries:$LD_LIBRARY_PATH
```
Replace `/path/to/custom/libraries` with the actual path to the directory containing the missing libraries.Once the `LD_LIBRARY_PATH` is set, attempt to run the executable again.If you encounter additional missing library errors, repeat steps until all dependencies are resolved.


- Resolving "The environment variable FSLOUTPUTTYPE is not defined" errors:
If you encounter an error related to the FSLOUTPUTTYPE environment variable not being set.Setting it to `NIFTI_GZ` is a correct solution, as it defines the output format for FSL tools to NIFTI compressed with gzip.Here's how you can resolve:
```bash
export FSLOUTPUTTYPE=NIFTI_GZ
```
By running this command, you've set the `FSLOUTPUTTYPE` environment variable to `NIFTI_GZ`,which should resolve the error you encountered.

## Usage
Once the McFlirt library is successfully compiled, you can use it to perform motion correction on fMRI datasets. Follow these steps to utilize McFlirt:
- Run McFlirt Command:
    Execute the ./mcflirt command with the required options and input file. Here is the basic syntax:
```bash
./mcflirt -in <input_file> [options]
```
Replace `<input_file>` with the path to your fMRI dataset.

- Specify Options:
    Customize the behavior of McFlirt by providing additional options as needed. Refer to the usage guide provided in the documentation for a list of available options and their descriptions.

## Conclusion
You have now successfully compiled the McFlirt library and learned how to utilize it for motion correction of fMRI datasets. Follow the provided instructions to compile the library and run the McFlirt command with your desired options. If you encounter any issues or have further questions, refer to the provided documentation or seek assistance from the project maintainers.

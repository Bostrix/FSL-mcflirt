# McFlirt Library - Compilation and Usage Guide

## Introduction
Welcome to the McFlirt library, a tool designed for motion correction of fMRI (functional Magnetic Resonance Imaging) data. This guide will walk you through the process of compiling the McFlirt library and utilizing its functionalities to generate motion-corrected fMRI datasets.

## Compilation
To compile the McFlirt library, follow these steps:
- Install Required Libraries:
    Ensure that all necessary libraries, such as Blas,Lapack,zlib, are installed on your system. Use the following command to install those:
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
Then, add $(ZNZLIB_LDFLAGS) in the compile step of the makefile.

- Compile Source Code:
    Execute the appropriate compile command to build the McFlirt library. For example:
```bash
make clean
make
```
This command will compile the source code and generate the executable file for McFlirt.

## Usage
Once the McFlirt library is successfully compiled, you can use it to perform motion correction on fMRI datasets. Follow these steps to utilize McFlirt:
- Run McFlirt Command:
    Execute the ./mcflirt command with the required options and input file. Here is the basic syntax:
```bash
./mcflirt -in <input_file> [options]
```
Replace <input_file> with the path to your fMRI dataset.

- Specify Options:
    Customize the behavior of McFlirt by providing additional options as needed. Refer to the usage guide provided in the documentation for a list of available options and their descriptions.

  ## Conclusion
You have now successfully compiled the McFlirt library and learned how to utilize it for motion correction of fMRI datasets. Follow the provided instructions to compile the library and run the McFlirt command with your desired options. If you encounter any issues or have further questions, refer to the provided documentation or seek assistance from the project maintainers.

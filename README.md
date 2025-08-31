# clix

A collection of shell aliases, configs and command shortcuts for development workflows, build systems, and environment management.

## Usage

The repository aims to be modular so only needed scripts are loaded into the shell environment.
There are two top level scripts for loading multiple scripts in a single line, designed to be used from
the common shell initialization files (e.g. `.bashrc`, `.zshrc`). They are explained below:

### all.sh

Loads all files provided in this repository.

### group.sh

Loads a specific group of scripts based on the first passed argument. The argument needs to be a valid path inside the `bits/` directory.

## Structure

All scripts are organized into the `bits/` directory. Subdirectories inside `bits/` are used to organize scripts by their functionality and purpose.
A subset of the available script files are explained below:

### buildsystem

- `bb.sh`: Provides `bb` command to build a project with the auto-detected build system.
- `bbcc.sh`: Like `bb.sh`, but provides `bbcc` command which only generates `compile_commands.json` for C++ projects.

#### cmake

- `default_generator.sh`: Sets the default CMake generator to Ninja.
- `cmake_reconfigure.sh`: Generates a `.cmake_reconfigure` file which can be used to re-run the last cmake configure command.

### c++

- `clang_default.sh`: Sets up Clang as the default compiler.
- `mold_default.sh`: Sets up Mold as the default linker.

### git

- `aliases.sh`: Git command aliases. Provides the following commands: `ga` (git add), `gs` (git status), `gc` (git commit), `gca` (git commit --amend).

### python

- `in_tree_include_paths.sh`: Sets up include paths for in-tree development of Python projects.
- `revenv.sh`: Provides `revenv` command which creates or activates a Python virtual environment and installs dependencies.

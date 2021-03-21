# System Bootstrap Script for macOS

The goal of this project is to make it simple to restore your workflow from a base install of macOS.

Using this tool makes it easy to:
- Uninstall most bloatware included in macOS
- Install the Homebrew packages you need
- Install alternative shells (such as ZSH and Bash 5)
- Configure Dropbox for syncing your dotfiles
- Install applications
- Set user preferences

This tool uses [modules](./modules) to perform the above actions. These are all native bash scripts and rely only on
dependencies included in macOS or installed by a core module (e.g. Homebrew).

## Usage

```bash
bash -c "$(curl -sL https://raw.githubusercontent.com/pawelgrimm/bootstrap/main/init.sh)"
```

The [`init.sh`](./init.sh) script will install macOS Command Line Tools (if they're not already installed), then clone
this repository to `~/.bootstrap` and run [`bootstrap.sh`](./bootstrap.sh).

### Module Selection

By default, the bootstrap script will run through all modules in the prescribed order, providing a description of what
actions the module will perform and prompting you whether or not you want to execute the module.

After each module has run, it will drop a mutex file named `.bootstrap-mutex--<module_name>` in the repository root
directory. You can `touch` a file of the same name to skip/ignore a specific module.

If you want to re-run a module, simply remove the mutex file – but be careful, not all modules are setup to gracefully
handle duplicate runs.

## References
* [https://github.com/lukiffer/macos-bootstrap](https://github.com/lukiffer/macos-bootstrap)

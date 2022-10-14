# Provisioning Ubuntu

This repository contain a collection fo script to install almost every tools I use.

I use this repo alongside a chezmoi dotfiles repository to provision a new ubuntu installation by simply installing git ([ssh setup](https://docs.github.com/en/authentication/connecting-to-github-with-ssh))and launching the installation script below.

## Disclaimer

Using the global script install a ton of tools, you might want to update the list before launching the installation or pick the tool you want to install. (A TODO on my part is a picker for the installed tools)

**⚠ You should always read a script before executing it on your system and avoid executing random scripts of the internet 😊**.

## Usage

Clone this repository:

```bash
git clone git@github.com:Jeremie-Chauvel/provision-me.git
```

then read the disclaimer, once done, run the global install script:

```bash
bash ./install.sh [optional chezmoi dotfiles repository]
```

ex:

```bash
bash ./install.sh git@github.com:Jeremie-Chauvel/chezmoi.git
```

or run a given script:

```bash
bash ./install/github-cli.sh
```

For dotfiles use [chezmoi](https://www.chezmoi.io/)

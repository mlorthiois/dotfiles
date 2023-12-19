# Personnal dotfiles

Main repository to setup a new development workspace.

Everything is automated from an Ansible playbook: `setup.yml`

## Install

1. [Install
   Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

2. Run the playbook

```sh
ansible-playbook -K setup.yml
```

Ansible will proceded to the installation and setup of:
- ZSH and configuration
- NVIM with all its plugins, LSP servers, etc.
- Python language: pyenv, LSP.
- ...

## Main tools

- Kitty as terminal emulator
- neovim as code editor
- zsh as shell
- JetBrains Mono Nerd Font with VSCode icons as monotype font

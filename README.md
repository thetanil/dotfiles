# dotfiles

https://www.chezmoi.io/user-guide/use-scripts-to-perform-actions/

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply thetanil

To clear the state of run_onchange_ scripts, run:

$ chezmoi state delete-bucket --bucket=entryState

To clear the state of run_once_ scripts, run:

$ chezmoi state delete-bucket --bucket=scriptState


TODO:

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

docker
vscode
copilot extension
compiled vim
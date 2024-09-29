# dotfiles

https://www.chezmoi.io/user-guide/use-scripts-to-perform-actions/

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply thetanil

To clear the state of run_onchange_ scripts, run:

$ chezmoi state delete-bucket --bucket=entryState

To clear the state of run_once_ scripts, run:

$ chezmoi state delete-bucket --bucket=scriptState

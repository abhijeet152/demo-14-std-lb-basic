# Terraform-githubactions-diff-env

# Setup vscode and github.

- Check if you have an SSH key. Run the following in your terminal: `ls -al ~/.ssh`

- Add your ssh key to the ssh-agent
        
        # Start the ssh-agent
        eval "$(ssh-agent -s)"

        # Add your key
        ssh-add ~/.ssh/id_rsa  # or id_rsa if using RSA
        

- Add SSH key to GitHub. Copy the public key to your clipboard: `cat ~/.ssh/id_ed25519.pub`

- Test ssh connection: `ssh -T git@github.com`

- Correct the remote URL. Ensure your repository remote uses SSH:

        git remote -v
        git remote set-url origin git@github.com:username/repository.git
    

- Setup main branch to push code.
  - Run below command in git bash vs code (repo name and demo name conflict)

        git init
        git branch -M main
        git add .
        git commit -m "first commit"
        git remote add origin https://github.com/abhijeet152/demo-11-bastion-vm.git
        git push -u origin main

- Push to repository. Now try pushing again: `git push --set-upstream origin main`

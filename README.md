# creditscloud

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fkondrashovsv%2Fcreditscloud%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

[![Deploy to IBM Cloud](https://cloud.ibm.com/devops/setup/deploy/button.png)](https://cloud.ibm.com/devops/setup/deploy?repository=<git_repository_URL>&branch=<git_branch>)

Deploy credits private blockchain to cloud


After deploy
1. ssh to MySignal1
2. $ export ANSIBLE_HOST_KEY_CHECKING=False
3. $ ansible-playbook -i production  --ask-vault-pass -e @group_vars/vault.yml site.yml


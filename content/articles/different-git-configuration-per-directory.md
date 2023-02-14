Title: Different Git configuration per directory
Slug: different-git-configuration-per-directory
Date: 2022-10-31 19:25:38
Description: "Use a different Git configuration per directory"

*Article is updated at 2023-02-14*

I have multiple accounts for GitLab and Github.
The reason for this is that I work for multiple companies and they
require me to use a unique email address and account for those services.

In some cases I perform the development on the same device. So I need to make
sure that I perform my work with the correct account details and SSH credentials.

Also I want to be able to push work to my personal accounts from the work device.
So in that case I need a similar setup.

By setting up my SSH and Git config in a specific way
I can commit with the correct details and authenticate using the required keys.

The following examples are using GitLab, but you can alter the examples to your needs.

## Gitconfig

Using a `.gitconfig`file I can control how Git behaves.
In my root I a gitconfig like this:

```shell
user@computer:~$ cat ~/.gitconfig
[user]
	email = user@domain.nl
	name = Therry van Neerven

[includeIf "gitdir:~/Projects/company/"]
	path = ~/Projects/company/.gitconfig
```

This config does two things:

1. It sets a default user setting
2. When I'm in a git directory which starts with `~/Projects/company` it loads `~/Projects/company/.gitconfig`

The second gitconfig loads specific data for the project of the company:

```shell
user@computer:~$ cat ~/Projects/company/.gitconfig
[user]
	email = user@company.com
	name = Therry van Neerven

[core]
    sshCommand=ssh -i ~/.ssh/id_ed25519.company -F /dev/null
```

The user key overrides the previous user key
and now my commits are using the company email.
Also the `sshCommand` is overriden, it now uses the specific key that is registered in the GitLab account.

In this way I always commit with the correct email address, and push my changes with the correct ssh key.

## SSH config (Old approach)

The approach below is an older alternative to defining the `sshCommand` in the `.gitconfig` file.
You can use it as a replacement of the `sshCommand`, in case you are running a git version older than 2.10.0.

When pulling and pushing code I also need to make sure that I use the right SSH keys.
This is done using a SSH config like this:

```shell
user@computer:~$ cat ~/.ssh/config
Host gitlab.com
     IdentityFile ~/.ssh/id_rsa

Host gitlab.company.com
     IdentityFile ~/.ssh/id_rsa.company
```

The first item picks the standard private for communication with GitLab.
The second item matches a different private key with the domain
of the GitLab instance of the company.

I also use a variant which allows me to use different keys for the same domain:

```shell
user@computer:~$ cat ~/.ssh/config
Host personal-gitlab
   Hostname gitlab.com
   IdentityFile ~/.ssh/id_rsa

Host company-gitlab
   Hostname gitlab.com
   IdentityFile ~/.ssh/id_rsa
```

In this case I need to change the repository url a little bit by swapping the hostname.

So `git@gitlab.com:user/repo.git` becomes `git@company-gitlab:user/repo.git`
in case I want to use the personal SSH key for communication.

## Resources

[SSH config](https://linux.die.net/man/5/ssh_config)

# action-auto-changelog

> Generate changelog automatically.

## Usage

Create a new file in `.github/workflows/changelog.yml` with the following:

```yml
name: 'Generate Auto Changelog'
on:
    push:
        branches:
            - master
jobs:
    master:
        name: 'build'
        runs-on: ubuntu-latest
        steps:
            - name: Generate Auto Changelog
              uses: ahmadawais/action-auto-changelog@master
              with:
                  github_token: ${{ secrets.GITHUB_TOKEN }}
```

That's about it.


pre-commit-golang
=================

golang hooks for http://pre-commit.com/

### Using these hooks

Add this to your `.pre-commit-config.yaml`

    - repo: git://github.com/SebastianRoll/pre-commit-golang
      sha: HEAD
      hooks:
        - id: go-fmt
        - id: goimports
        - id: go-vet
        - id: go-lint
        - id: validate-toml
        - id: no-go-testing
        - id: gometalinter

### Available hooks

- `go-fmt` - Runs `gofmt`, requires golang
- `goimports` - Runs `goimports`, requires goimports
- `go-vet` - Runs `go vet`, requires golang
- `go-lint` - Runs `golint`, requires https://github.com/golang/lint
- `validate-toml` - Runs `tomlv`, requires
   https://github.com/BurntSushi/toml/tree/master/cmd/tomlv
- `no-go-testing` - Checks that no files are using `testing.T`, if you want
  developers to use a different testing framework
- `gometalinter` - run `gometalinter --config gometalinter.json ./...`

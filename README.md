# hugo-modus

An opinionated Hugo theme using the [colour palette of the Modus themes](https://protesilaos.com/emacs/modus-themes-colors).

## Installation

1. Install the theme in your project
    ```shell
    git submodule add https://github.com/zkazure/hugo-modus.git themes/hugo-modus
    ```

2. Configure the theme in `hugo.toml`
    ```
    theme = "hugo-modus"
    ```

## Usage

### New section
```shell
hugo new -k section posts/_index.md
```

### New content
```shell
hugo new posts/your-first-post.md
```

## Development

### Watch for changes and rebuild CSS
```shell
make watch
```

### Start the Hugo server for developing
```shell
make dev
```

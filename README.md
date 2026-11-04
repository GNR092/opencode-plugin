# Plugin de OpenCode V2 para Oh My Zsh

Plugin de Oh My Zsh que añade completaciones de Zsh para la CLI de **OpenCode V2**.

## Requisitos

- [OpenCode V2](https://opencode.ai/v2/docs/cli/) instalado y disponible en `$PATH`
- [Oh My Zsh](https://ohmyz.sh/) instalado

## Instalación

### Método 1: Clonar directamente en Oh My Zsh (Recomendado)

```bash
git clone <tu-repo>/opencode-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/opencode
```

### Método 2: Como submódulo git (para dotfiles)

```bash
cd ~/.oh-my-zsh
git submodule add <tu-repo>/opencode-plugin.git custom/plugins/opencode
```

### Método 3: Manual

```bash
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/opencode
# Copiar opencode.plugin.zsh y _opencode a ese directorio
```

## Configuración

Agrega `opencode` a tu array de plugins en `~/.zshrc`:

```zsh
plugins=(
  git
  opencode
  # ... otros plugins
)
```

Luego recarga la configuración:

```zsh
source ~/.zshrc
```

## Qué hace este plugin

1. **Verifica que OpenCode esté instalado** - Muestra una advertencia si no lo está.
2. **Carga completaciones nativas de Zsh** - `_opencode` se genera con `opencode --completions zsh` y cubre los comandos, subcomandos y flags de la CLI instalada.
3. **Sugiere modelos dinámicamente** - `--model`, `-m` y `--model=<prefijo>` consultan `opencode models`.

## Completaciones disponibles

El archivo incluido se generó con OpenCode **v2.2.5**. Sus comandos principales son:

- Comandos: `upgrade` (`update`), `uninstall`, `acp`, `api`, `debug`, `auth`, `mcp`, `plugin`, `models`, `stats`, `mini`, `run`, `session`, `service`, `reload`, `pair`, `serve`.
- Subcomandos:
  - `auth`: `list`, `login`, `logout`, `export`, `import`, `switch`.
  - `debug`: `agents`, `config`, `heap-dump`, `paths`.
  - `mcp`: `list`, `add`, `auth`, `logout`.
  - `plugin`: `list`, `add`, `check`, `update`, `remove`.
  - `session`: `list`, `delete`, `export`, `import`.
  - `service`: `start`, `restart`, `status`, `stop`, `get`, `set`, `unset`.
- Flags globales y de cada comando, según la versión instalada. `--completions` es una opción global, no un subcomando.

## Estructura

```
opencode/
├── opencode.plugin.zsh    # Plugin principal (carga completions)
├── _opencode              # Completaciones nativas de OpenCode V2 para Zsh
└── README.md              # Este archivo
```

## Solución de problemas

### Las completaciones no funcionan (Tab)

Si al presionar `Tab` no aparecen las completaciones de OpenCode, regenera el caché:

```zsh
rm -f ~/.zcompdump*
exec zsh
```

### Actualizar las completaciones

Regenera el archivo con la CLI V2 instalada:

```bash
completion_file="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/opencode/_opencode"
opencode --completions zsh > "$completion_file"
```

La CLI genera la base estática; al regenerarla, conserva el bloque `Custom model completion` al inicio de `_opencode` para mantener las sugerencias dinámicas de modelos.

## Actualizar

```bash
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/opencode
git pull
source ~/.zshrc
```

## Licencia

MIT - Basado en el generador nativo de completaciones de OpenCode V2.

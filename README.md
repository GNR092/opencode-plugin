# OpenCode Plugin for Oh My Zsh

Plugin de Oh My Zsh que integra **OpenCode** (agente de codificación en terminal) con completaciones de Zsh.

## Requisitos

- [OpenCode](https://opencode.ai/) instalado
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

1. **Verifica que OpenCode esté instalado** - Muestra advertencia si no lo está
2. **Carga completaciones automáticas** - Generadas oficialmente por la CLI (`opencode completion zsh`) con una mejora: completa dinámicamente los modelos en `--model`/`-m`

## Completaciones disponibles

Al escribir `opencode <TAB>` obtienes:

- Comandos: `completion`, `acp`, `mcp`, `run`, `debug`, `providers`, `agent`, `upgrade`, `uninstall`, `serve`, `web`, `models`, `stats`, `export`, `import`, `github`, `pr`, `session`, `plugin`, `db`
- Flags globales y por comando (`--model`, `--session`, `--agent`, `--auto`, `--mini`, etc.)
- **Modelos disponibles** (dinámico vía `opencode models`) en: `--model`, `-m`, `--model=<prefijo>`
- Completaciones dinámicas generadas por la propia CLI en tiempo de ejecución

## Estructura

```
opencode/
├── opencode.plugin.zsh    # Plugin principal (carga completions)
├── _opencode              # Completaciones oficiales de Zsh (yargs)
└── README.md              # Este archivo
```

## Solución de problemas

### Las completaciones no funcionan (Tab)

Si al presionar `Tab` no aparecen las completaciones de OpenCode, regenera el caché:

```zsh
rm -f ~/.zcompdump*
exec zsh
```

### Completaciones desactualizadas

El script de completación se genera desde la versión instalada de opencode:

```bash
opencode completion zsh > ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/opencode/_opencode
```

## Actualizar

```bash
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/opencode
git pull
source ~/.zshrc
```

## Licencia

MIT - Basado en las completaciones oficiales de OpenCode (yargs)

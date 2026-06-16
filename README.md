# Atelier Ayesha Plus - Tradução PT-BR (PS Vita)

Tradução para português do Brasil de *Atelier Ayesha: The Alchemist of Dusk Plus*, para PlayStation Vita.

## Sobre

- Jogo: Atelier Ayesha: The Alchemist of Dusk (Plus)
- Código: PCSE00584 (USA)
- Plataforma: PlayStation Vita
- Situação: em revisão dos textos

Baseado no [Atelier Translator](https://github.com/Ferripro321/Atelier-Translator), do Ferripro321.

<<<<<<< Updated upstream
## Acesso online (iPad / Safari)

A ferramenta de revisão roda direto no navegador, sem instalar nada:

**https://wolffsroom.github.io/AtelierAyeshaPlus-translationPTBR-PSV/**

Funciona no iPad/Safari (e no PC). No iPad, as revisões ficam salvas no próprio navegador e podem ser exportadas em um `.zip` com a estrutura da pasta `Revisado/`. No PC com Chrome/Edge, é possível gravar direto na pasta.

> Para o link acima funcionar, é preciso habilitar o GitHub Pages uma vez: **Settings → Pages → Source: Deploy from a branch → `main` → `/ (root)` → Save**.
=======
## Interface de Revisão Online

Acesse a interface diretamente pelo GitHub Pages:

**[wolffsroom.github.io/AtelierAyeshaPlus-translationPTBR-PSV](https://wolffsroom.github.io/AtelierAyeshaPlus-translationPTBR-PSV)**

A interface exibe três painéis lado a lado:
- **Original em Inglês** — texto da versão en-US (referência)
- **Sem Revisar** — texto atual da tradução PT-BR
- **Revisado** — campo editável com a revisão final

### GitHub Sync — salvar revisões direto no repositório

**Primeiro acesso (configuração única por fork):**
1. Clique em **Sincronizar com GitHub**
2. Defina um PIN de 6 dígitos (protege seu token com AES-GCM + PBKDF2)
3. Confirme o PIN
4. Cole um **GitHub Personal Access Token** com permissão `Contents: Read & Write` neste repositório
   - Gere em: GitHub → Settings → Developer settings → Personal access tokens → Fine-grained
5. Clique em **Salvar configuração** — o token criptografado é salvo como `config.json` no repo

**Acessos seguintes:**
1. Clique em **Sincronizar com GitHub**
2. Digite o PIN — os arquivos de `Sem revisar/` carregam direto do repositório
3. Revise e clique em **Salvar arquivo** — salva todos os arquivos com alterações em `Revisado/`

> Quem fizer fork precisa configurar seu próprio PIN e token. O `config.json` de um fork não funciona no outro.

### Uso offline (pasta local)

Clique em **Selecionar a pasta do projeto** e aponte para a pasta que contém as subpastas abaixo.
>>>>>>> Stashed changes

## De onde vêm os textos

Os diálogos ficam dentro do `.psarc` do jogo:

```
ux0:app/PCSE00584/Res/resources1.psarc  →  /Event/event/*.ebm
```

Desempacote o `resources1.psarc` com o [UnPSARC](https://github.com/rm-NoobInCoding/UnPSARC) e copie os `.ebm` de `Event/event` para a pasta `Original`.

Os `.ebm` de `Event/event` contêm apenas os **textos e falas (diálogos)**. Menus, texturas e gráficos ficam em outros arquivos e ainda não entram neste fluxo.

## Pastas

| Pasta | Conteúdo |
|---|---|
| `Original` | `.ebm` extraídos do jogo (base PT-BR do Switch) |
| `Inglês` | `.ebm` da versão en-US (referência em inglês) |
| `Inglês JSON` | JSON gerados dos `.ebm` en-US — carregados como referência na interface |
| `Sem revisar` | JSON gerados dos `.ebm` PT-BR — texto a revisar |
| `Revisado` | JSON revisados |
| `Traduzido` | `.ebm` finais gerados a partir dos JSON revisados |
| `Tools` | gust_tools (VitaSmith) usados na conversão |

## Como usar (Windows)

1. Copie os `.ebm` de `Event/event` para `Original`.
<<<<<<< Updated upstream
2. Rode `1 - Gerar JSON (Original para Sem revisar).bat` para converter `.ebm` em JSON.
3. Abra o `index.html` (ou acesse a [versão online](https://wolffsroom.github.io/AtelierAyeshaPlus-translationPTBR-PSV/)) para revisar os textos e salvar em `Revisado`.
4. Rode `2 - Gerar EBM (Revisado para Traduzido).bat` para gerar os `.ebm` traduzidos em `Traduzido`.
5. Reempacote no `.psarc` e instale no app `PCSE00584`.
=======
2. Copie os `.ebm` da versão en-US para `Inglês/event/`.
3. Rode **`1 - Gerar JSON (Original para Sem revisar).bat`** — converte os `.ebm` PT-BR em JSON.
4. Rode **`Gerar JSON (Inglês).bat`** — converte os `.ebm` en-US em JSON de referência (saída em `Inglês JSON/`).
5. Rode **`push-json.bat`** — sobe `Sem revisar/`, `Revisado/` e `Inglês JSON/` ao GitHub.
6. Acesse a interface online para revisar e salvar via GitHub Sync.
7. Rode **`2 - Gerar EBM (Revisado para Traduzido).bat`** — gera os `.ebm` finais em `Traduzido/`.
8. Reempacote com `PSARC/Repack-Resources1.ps1` e copie para o Vita.
>>>>>>> Stashed changes

A conversão `.ebm` ↔ JSON é feita pelo `gust_ebm` (gust_tools, de VitaSmith).

## Próximas etapas

- Traduzir menus e interfaces (`.bsb`, `.gxt`).
- Editar texturas com texto embutido.
- Legendar os vídeos (já ajustados para 960×544).
- Revisão ortográfica e testes no Vita.

## Créditos

- Tradução: [Wolff's Room](https://wolffsroom.wordpress.com)
- Projeto base: Ferripro321 — [Atelier Translator](https://github.com/Ferripro321/Atelier-Translator)
- gust_tools: VitaSmith (GPLv3) — ver `Tools/LICENSE.txt`
- UnPSARC: rm-NoobInCoding — [github.com/rm-NoobInCoding/UnPSARC](https://github.com/rm-NoobInCoding/UnPSARC)

## Aviso

Projeto de fãs, sem fins lucrativos. *Atelier Ayesha* e seus conteúdos pertencem à Gust / Koei Tecmo. Nenhum arquivo do jogo é distribuído neste repositório.

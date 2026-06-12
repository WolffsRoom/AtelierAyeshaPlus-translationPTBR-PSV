# Atelier Ayesha Plus - Tradução PT-BR (PS Vita)

Tradução para português do Brasil de *Atelier Ayesha: The Alchemist of Dusk Plus*, para PlayStation Vita.

Este repositório contém apenas as **ferramentas e o fluxo de trabalho** da tradução. Os arquivos do jogo não são distribuídos aqui.

## Sobre

- Jogo: Atelier Ayesha: The Alchemist of Dusk (Plus)
- Código: PCSE00584 (USA)
- Plataforma: PlayStation Vita
- Situação: em revisão dos textos

Baseado no [Atelier Translator](https://github.com/Ferripro321/Atelier-Translator), do Ferripro321.

## Acesso online (iPad / Safari)

A ferramenta de revisão roda direto no navegador, sem instalar nada:

**https://wolffsroom.github.io/AtelierAyeshaPlus-translationPTBR-PSV/**

Funciona no iPad/Safari (e no PC). No iPad, as revisões ficam salvas no próprio navegador e podem ser exportadas em um `.zip` com a estrutura da pasta `Revisado/`. No PC com Chrome/Edge, é possível gravar direto na pasta.

> Para o link acima funcionar, é preciso habilitar o GitHub Pages uma vez: **Settings → Pages → Source: Deploy from a branch → `main` → `/ (root)` → Save**.

## De onde vêm os textos

Os diálogos ficam dentro do `.psarc` do jogo:

```
ux0:app/PCSE00584/Res/resources1.psarc  ->  /Event/event/*.ebm
```

Desempacote o `resources1.psarc` com o [UnPSARC](https://github.com/rm-NoobInCoding/UnPSARC) (extrator de PSARC do PS Vita) e copie os `.ebm` de `Event/event` para a pasta `Original`.

Os `.ebm` de `Event/event` contêm apenas os **textos e falas (diálogos)** do jogo. Menus, interfaces, texturas e gráficos ficam em outros arquivos e ainda não entram neste fluxo.

## Pastas

- `Original` - arquivos `.ebm` extraídos do jogo
- `Sem revisar` - JSON gerados a partir dos `.ebm`
- `Revisado` - JSON já revisados
- `Traduzido` - `.ebm` finais, gerados a partir dos JSON revisados
- `Tools` - gust_tools (VitaSmith) usados na conversão

As pastas vêm vazias no repositório; coloque os seus próprios arquivos.

## Como usar (Windows)

1. Copie os `.ebm` de `Event/event` para `Original`.
2. Rode `1 - Gerar JSON (Original para Sem revisar).bat` para converter `.ebm` em JSON.
3. Abra o `index.html` (ou acesse a [versão online](https://wolffsroom.github.io/AtelierAyeshaPlus-translationPTBR-PSV/)) para revisar os textos e salvar em `Revisado`.
4. Rode `2 - Gerar EBM (Revisado para Traduzido).bat` para gerar os `.ebm` traduzidos em `Traduzido`.
5. Reempacote no `.psarc` e instale no app `PCSE00584`.

A conversão `.ebm` <-> JSON é feita pelo `gust_ebm` (gust_tools, de VitaSmith).

## Próximas etapas

- Validar quais texturas e gráficos precisam de tradução e editar os arquivos de textura (`.gxt`).
- Traduzir os menus e outras interfaces.
- Extrair, editar e reempacotar os gráficos.
- Legendar os vídeos (já ajustados para 960x544).
- Revisão ortográfica e testes no jogo.

## Créditos

- Tradução: Wolff's Room (https://wolffsroom.wordpress.com)
- Projeto base: Ferripro321 - Atelier Translator
- gust_tools: VitaSmith (GPLv3) - ver `Tools/LICENSE.txt`
- UnPSARC: rm-NoobInCoding (https://github.com/rm-NoobInCoding/UnPSARC) - extração do `.psarc`

## Aviso

Projeto de fãs, sem fins lucrativos. *Atelier Ayesha* e seus conteúdos pertencem à Gust / Koei Tecmo. Nenhum arquivo do jogo é distribuído neste repositório.

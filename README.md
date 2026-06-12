# Atelier Ayesha Plus - Tradução PT-BR (PS Vita)

Tradução para português do Brasil de *Atelier Ayesha: The Alchemist of Dusk Plus*, para PlayStation Vita.

Este repositório contém apenas as **ferramentas e o fluxo de trabalho** da tradução. Os arquivos do jogo não são distribuídos aqui.

## Sobre

- Jogo: Atelier Ayesha: The Alchemist of Dusk (Plus)
- Código: PCSE00584 (USA)
- Plataforma: PlayStation Vita
- Situação: em revisão dos textos

Baseado no [Atelier Translator](https://github.com/Ferripro321/Atelier-Translator), do Ferripro321.

## De onde vêm os textos

Os diálogos ficam dentro do `.psarc` do jogo:

```
ux0:app/PCSE00584/Res/resources1.psarc  ->  /Event/event/*.ebm
```

Desempacote o `resources1.psarc` (por exemplo, com o Total Commander) e copie os `.ebm` de `Event/event` para a pasta `Original`.

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
3. Abra `Revisao Atelier Ayesha.html` para revisar os textos e salvar em `Revisado`.
4. Rode `2 - Gerar EBM (Revisado para Traduzido).bat` para gerar os `.ebm` traduzidos em `Traduzido`.
5. Reempacote no `.psarc` e instale no app `PCSE00584`.

A conversão `.ebm` <-> JSON é feita pelo `gust_ebm` (gust_tools, de VitaSmith).

## Próximas etapas

- Extrair, editar e reempacotar os gráficos.
- Legendar os vídeos (já ajustados para 960x544).
- Revisão ortográfica e testes no jogo.

## Créditos

- Tradução: Wolff's Room (https://wolffsroom.wordpress.com)
- Projeto base: Ferripro321 - Atelier Translator
- gust_tools: VitaSmith (GPLv3) - ver `Tools/LICENSE.txt`

## Aviso

Projeto de fãs, sem fins lucrativos. *Atelier Ayesha* e seus conteúdos pertencem à Gust / Koei Tecmo. Nenhum arquivo do jogo é distribuído neste repositório.

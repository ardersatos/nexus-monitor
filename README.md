<div align="center">

# ◈ NEXUS // MONITOR

**Monitor do PC, otimizações para jogos e controlo pelo telemóvel — tudo a correr só no teu PC.**

![Versão](https://img.shields.io/badge/vers%C3%A3o-2.2.2-8fd8ff?style=for-the-badge)
![Windows](https://img.shields.io/badge/Windows-10%20%7C%2011-c4b5ff?style=for-the-badge&logo=windows11&logoColor=white)
![Privacidade](https://img.shields.io/badge/dados-ficam%20no%20PC-7dffcf?style=for-the-badge)
![Línguas](https://img.shields.io/badge/PT%20%C2%B7%20EN%20%C2%B7%20ES%20%C2%B7%20FR%20%C2%B7%20DE-ffd27a?style=for-the-badge)

[**⬇ Transferir v2.2.2**](versoes/v2.2.2/NEXUS-Monitor-v2.2.2.zip?raw=1) · [Atualização pequena](versoes/v2.2.2/NEXUS-Monitor-v2.2.2-update.zip?raw=1) · [Novidades](CHANGELOG.md) · [Privacidade](PRIVACIDADE.md) · [English](README.en.md)

<img src="docs/img/painel.png" alt="Painel principal do NEXUS Monitor" width="900">

</div>

---

## O que é

O NEXUS Monitor é uma app para Windows que mostra, em tempo real e numa página bonita no browser, tudo o que se passa no PC: processador, núcleos, RAM, placa gráfica, temperaturas, ventoinhas, consumo, discos, rede e os **FPS e a latência dos jogos**. Junta uma página de **Performance** com dezenas de otimizações do Windows (todas explicadas e reversíveis), um **Deep Scan** para os discos, um **overlay em jogo**, um **plugin para a Stream Deck** e acesso pelo **telemóvel** na rede de casa.

É feito para quem joga, mas explicado para quem não percebe de PCs: cada cartão tem uma explicação, e o botão 🧒 **SIMPLES** mostra-a em linguagem de criança.

## Destaques

| | |
|---|---|
| 📊 **Monitor ao vivo** | CPU por núcleo, RAM, GPU, temperaturas, ventoinhas, consumo, discos, rede, processos e FPS/1% low/frametime dos jogos (PresentMon). |
| ⚡ **Performance** | Otimizações do Windows para jogos com risco, ganho estimado e REPOR; debloat; perfis por jogo; limite de FPS; boost de jogo; teste de estabilidade (CPU, RAM e GPU). |
| 🎮 **Jogos** | Sessões com FPS e gargalo, engasgos por minuto, tempo de carregamento por disco, fechar programas ao jogar, overlays ativos, medições antes/depois. |
| 🖥 **Hardware** | Fonte de alimentação (chega?), o que limita o boost, simulador de upgrade, inventário com garantias, ventoinhas (curvas e proteção da bomba de água), BIOS e drivers. |
| 💽 **Discos** | Saúde e vida dos SSD, velocidade, otimizar (TRIM/desfragmentar), espaço escondido, duplicados, limpeza e desinstalador sem restos. |
| 🌐 **Rede** | Ping contínuo, melhor DNS, teste de velocidade e de bufferbloat, Wi-Fi, quem usa a internet, prioridade de rede para o jogo, Wake-on-LAN. |
| 🔒 **Sistema** | Segurança do Windows, versão e fim do suporte, atualizações (desinstalar uma), crashes explicados, reparar o Windows, tempo de arranque. |
| 📱 **Telemóvel** | Painel no telemóvel (app no ecrã principal), comando para o PC, abrir jogos, desligar quando um download acaba. Cada telemóvel é aceite no PC. |
| 🎛 **Stream Deck** | Teclas com gráficos ao vivo, ações do NEXUS e música com a capa do que está a tocar. |

<table>
<tr>
<td><img src="docs/img/performance.png" alt="Otimizações" width="440"></td>
<td><img src="docs/img/jogos.png" alt="Jogos" width="440"></td>
</tr>
<tr>
<td><img src="docs/img/hardware.png" alt="Hardware" width="440"></td>
<td><img src="docs/img/discos.png" alt="Discos" width="440"></td>
</tr>
</table>

<sub>Imagens com dados de exemplo.</sub>

## Instalar

1. Transfere **[NEXUS Monitor v2.2.2.zip](versoes/v2.2.2/NEXUS-Monitor-v2.2.2.zip?raw=1)**.
2. Botão direito no zip → **Extrair tudo…** (não corras nada de dentro do zip).
3. Abre a pasta e faz duplo clique em **`INSTALAR NEXUS.bat`**.
4. Escolhe a pasta (ou deixa a sugerida), os extras opcionais e aceita o pedido de administrador.

O instalador compila o NEXUS no próprio PC (com o compilador do .NET que já vem com o Windows) e descarrega o LibreHardwareMonitor para ler os sensores. Extras opcionais: PresentMon (FPS), gdu (Deep Scan) e o plugin da Stream Deck.

**Requisitos:** Windows 10 ou 11 (64 bits), .NET Framework 4.8 (já vem com o Windows), ligação à internet na instalação.

## Atualizar

- **Pelo próprio NEXUS:** ele procura versões novas ao abrir e de hora a hora e mostra o que muda. Carregas em **INSTALAR** e trata de tudo (confirma o SHA-256 do download antes de instalar).
- **À mão:** se tens uma das duas versões anteriores, transfere a **[atualização pequena](versoes/v2.2.2/NEXUS-Monitor-v2.2.2-update.zip?raw=1)**, extrai e corre `ATUALIZAR NEXUS.bat`. Se não, usa o zip completo.

A verificação de atualizações pode ser desligada em **Opções → Geral**. Todas as versões estão em [`versoes/`](versoes).

## Privacidade

Nada sai do teu PC: não há contas, anúncios, telemetria nem servidores do NEXUS. As únicas ligações à internet são as que pedes (teste de velocidade, notificações ntfy) e a verificação de atualizações neste repositório, que se pode desligar. Detalhes em **[PRIVACIDADE.md](PRIVACIDADE.md)**.

## Perguntas frequentes

<details><summary><b>O antivírus diz que é perigoso. É?</b></summary>

O NEXUS é compilado no teu PC a partir do código que vem no zip (podes lê-lo na pasta `codigo`). Programas novos e sem assinatura às vezes são marcados por engano pela análise automática. Se acontecer, envia o ficheiro à Microsoft como falso positivo e diz-nos numa [issue](../../issues).
</details>

<details><summary><b>As otimizações podem estragar o Windows?</b></summary>

Cada uma mostra o risco, e o NEXUS guarda o valor original antes de mudar. **REPOR** volta exatamente ao que estava. Antes de aplicar, é criado um ponto de restauro do Windows (no máximo um por dia).
</details>

<details><summary><b>Não aparecem temperaturas ou ventoinhas.</b></summary>

Confirma que o NEXUS corre como administrador e que o modo de sensores é o "Completo" (Opções → Geral). Algumas placas-mãe não deixam ler certas ventoinhas.
</details>

<details><summary><b>Como desinstalo?</b></summary>

Em **Definições → Aplicações** ou com `DESINSTALAR NEXUS.bat` na pasta do NEXUS. Se quiseres o Windows como estava, carrega antes em **REPOR** na Performance.
</details>

## Problemas e ideias

Encontraste um erro ou tens uma ideia? Abre uma [issue](../../issues/new/choose). Para erros, junta a versão (canto inferior do painel), o Windows que usas e o que aconteceu.

---

<div align="center"><sub>NEXUS Monitor · <a href="CHANGELOG.md">histórico de versões</a></sub></div>

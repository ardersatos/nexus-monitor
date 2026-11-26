# Histórico de versões

Todas as versões estão em [`versoes/`](versoes). O NEXUS mostra estas notas na janela NOVIDADES.

## v2.2.2
[⬇ zip completo](versoes/v2.2.2/NEXUS-Monitor-v2.2.2.zip?raw=1) · [atualização](versoes/v2.2.2/NEXUS-Monitor-v2.2.2-update.zip?raw=1)

- Corrigido: o plugin da Stream Deck fechava-se logo ao abrir desde a 2.1 (a Stream Deck acabava por o desativar).
- Procura atualizações sempre que o NEXUS abre e de hora a hora (se a ligação ao GitHub estiver ligada).

## v2.2.1
[⬇ zip completo](versoes/v2.2.1/NEXUS-Monitor-v2.2.1.zip?raw=1) · [atualização](versoes/v2.2.1/NEXUS-Monitor-v2.2.1-update.zip?raw=1)

- Ventoinhas: curvas pela temperatura do CPU ou da GPU, ou valor fixo (modo Completo).
- Ladrões de FPS: quando os FPS caem, o NEXUS vê que programas estavam a gastar o processador.
- Ping em jogo (latência, jitter e perdidos) e o DNS mais rápido com um clique.
- Limpeza automática semanal ou diária, nunca a meio de um jogo.
- BIOS e drivers antigos, com as páginas oficiais.
- Modo streaming (Alt+Shift+P): esconde IPs, nome do PC e pastas.
- O teu PC comparado com outros e FPS esperados.
- Notificações no telemóvel (app ntfy), mesmo fora de casa.
- Overlay com letra, cores, contorno, ping e gráfico de frametime.
- Assistente de configuração e Wake-on-LAN para ligar o PC à distância.
- Performance arrumada em separadores (Início, Jogos, Otimizar, Hardware, Rede, Sistema) e explicações atrás do ⓘ.
- Cenários com um clique (Silencioso, Normal, Máximo e os teus), não incomodar em jogo e limite de FPS automático.
- Teste de estabilidade da placa gráfica, verificações (Hz do monitor, XMP, PCIe), bateria e teste do monitor.
- Crashes explicados, reparar o Windows (SFC/DISM), tempo de arranque e programas como administrador.
- Velocidade dos discos e ficheiros duplicados no Deep Scan; desgaste dos SSD pelo SMART.
- Avisar, suspender ou desligar quando uma transferência acaba, outros PCs da casa e partilhar resultados como imagem.

## v2.1
[⬇ zip completo](versoes/v2.1/NEXUS-Monitor-v2.1.zip?raw=1) · [atualização](versoes/v2.1/NEXUS-Monitor-v2.1-update.zip?raw=1)

- Atualizações pelo GitHub: o NEXUS avisa quando há versão nova e instala-a com um botão, sem o aviso do Windows. Podes desligar nas Opções.
- Histórico de temperaturas e uso: últimas horas ou 7 dias, na página principal.
- Resumo de cada sessão de jogo: tempo, FPS médio, pior 1% e temperaturas máximas.
- Saúde dos discos (SMART) no Deep Scan e versão do driver da placa gráfica na Performance.
- Modo poupança com o PC parado, cópia de segurança das definições, pesquisa nas opções e relatório do PC.
- Gargalo CPU ou GPU e avisos no overlay (temperatura, RAM cheia, quedas de FPS).
- Limite de FPS por jogo (com o RivaTuner) e limite de energia da placa NVIDIA.
- Arranque do Windows: liga e desliga os programas que abrem com o PC.
- Teste de estabilidade do processador e da RAM, com temperatura máxima e erros.
- Telemóvel: ícone no ecrã principal e controlo do PC (música, volume, overlay, suspender, desligar).
- Stream Deck: teclas novas (overlay, medir FPS, limpar RAM, boost, gargalo, tempo de jogo).
- Estado no Discord com o jogo e os FPS (opcional).

## v2.0
[⬇ zip completo](versoes/v2.0/NEXUS-Monitor-v2.0.zip?raw=1) · [atualização](versoes/v2.0/NEXUS-Monitor-v2.0-update.zip?raw=1)

- Perfis por jogo: escolhe overlay, boost e otimizações para cada jogo; ligam-se sozinhos quando o jogo abre e voltam ao fechar.
- Medir os FPS a sério: grava cada frame e compara antes e depois das otimizações (Alt+Shift+M dentro do jogo).
- Updates mais pequenos: o zip de update só traz os ficheiros que mudaram.
- Updates para quem está até 2 versões atrás (o zip de update serve para a 1.8 e para a 1.9).

## v1.9
- Página Performance: mais de 50 otimizações do Windows para jogos (energia, jogos, sistema, rede), adaptadas ao teu PC (portátil ou desktop, Intel ou AMD, NVIDIA, AMD ou Intel), com o ganho estimado e escolha do que aplicar. Tudo pode ser reposto.
- Debloat do Windows: privacidade, anúncios, Copilot, Recall e as apps que vêm com o Windows.
- Overlay em jogo com FPS, CPU, GPU, temperaturas e RAM: escolhes o que aparece e arrastas para onde quiseres. Atalho Alt+Shift+O.
- Boost de jogo: prioridade alta, desempenho máximo e RAM limpa só enquanto jogas.
- Modo simples: só o essencial, sem IPs nem detalhes técnicos.
- O teste de comandos passou para dentro da página Performance.
- Opções arrumadas em separadores, com o tema e o idioma lá dentro.

## v1.8
- Teste de velocidade no cartão REDE: download, upload e latência (em repouso e com carga), com o servidor Cloudflare mais próximo. Só corre quando carregas.
- srgb
- Cores do SignalRGB: o tema segue o efeito em tempo real nas páginas, no menu do ícone e na Stream Deck, com atraso ajustável. O plugin fica só neste PC.
- Cores do SignalRGB: o tema segue o efeito em tempo real nas páginas e no menu do ícone, com atraso ajustável. O plugin fica só neste PC.
- Desinstalador de programas no Deep Scan: vários de uma vez, modo silencioso, remoção forçada e limpeza dos restos (pastas, atalhos, registo, serviços, tarefas e firewall), com cópia do registo.
- Botão de novidades e tutorial guiado (podes voltar a vê-lo nas Opções).
- Página principal mais limpa: os discos passam a estar só no Deep Scan e os sensores ficam todos à vista, em duas colunas.

## v1.7.1
- Instalador: escolher outra pasta voltou a funcionar e há a opção de escrever o caminho à mão.
- O atualizador volta a encontrar sozinho a pasta onde o NEXUS está instalado.
- Opções > Pastas: botões para abrir a pasta das definições e a pasta do NEXUS.

## v1.7
- Instalação a sério: escolhes a pasta e os atalhos, e o NEXUS fica em Definições > Aplicações.
- Página para testar comandos, com vibração nos comandos Xbox, DualShock 4 e DualSense.
- Deep Scan: a Reciclagem e os registos antigos do Windows passam a entrar na limpeza.
- Gráficos mais suaves e alertas do próprio NEXUS por cima dos jogos.

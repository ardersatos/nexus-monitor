# Histórico de versões

Todas as versões estão em [`versoes/`](versoes). O NEXUS mostra estas notas na janela NOVIDADES.

## v2.3.1
[⬇ zip completo](versoes/v2.3.1/NEXUS-Monitor-v2.3.1.zip?raw=1) · [atualização](versoes/v2.3.1/NEXUS-Monitor-v2.3.1-update.zip?raw=1)

- Desinstalar a partir do NEXUS: em OPÇÕES → GERAL → DESINSTALAR e no menu do ícone junto ao relógio. Abre o desinstalador, que mostra o que sai e pergunta antes de apagar.
- Os ficheiros do NEXUS passam a ter nomes em inglês: INSTALL NEXUS.bat, UPDATE NEXUS.bat, UNINSTALL NEXUS.bat e INSTALL STREAM DECK ADDON.bat. O texto em português fica em README.pt.txt e CHANGELOG.pt.txt.
- O instalador, o atualizador e o desinstalador falam a língua do Windows (português, inglês, espanhol, francês ou alemão), incluindo as teclas das perguntas.
- Corrigido: a atualização não refazia o plugin da Stream Deck quando não encontrava a app (as teclas novas de música não apareciam). Agora refaz sempre que o plugin está instalado.

## v2.3
[⬇ zip completo](versoes/v2.3/NEXUS-Monitor-v2.3.zip?raw=1) · [atualização](versoes/v2.3/NEXUS-Monitor-v2.3-update.zip?raw=1)

- DEEP SCAN organizado em separadores: 🔍 Analisar (o mapa e as pastas), 🧹 Limpar, ❤ Saúde e 📦 Programas. Tudo o que é discos está lá: vida dos SSD (TB escritos e ritmo por dia), otimizar discos (TRIM/desfragmentar), espaço escondido, poupar o SSD, espaço da Steam e programas esquecidos.
- PERFORMANCE reorganizada: Hardware só com as peças, Sistema com o Windows e os drivers, e um separador novo 🩺 PROBLEMAS com tudo o que serve quando algo corre mal (primeiros socorros, crashes, testes, reparar, arranque lento, PC que não dorme, zip de suporte).
- NVIDIA App: um botão desliga a app, o overlay, o arranque, o serviço e as tarefas dela (o driver e o Painel de Controlo ficam). "Manter desligada" volta a desligar sempre que o NEXUS abre.
- Jogos: engasgos (soluços) contados por sessão com os minutos piores, tempo de carregamento por disco, fechar programas ao jogar e reabrir no fim, overlays ativos e abrir jogos pelo telemóvel.
- Hardware: fonte de alimentação (chega ou não, com aviso de pico), o que limita o boost, simulador de upgrade, inventário com números de série e garantias, baterias dos periféricos e drivers gráficos antigos.
- Otimizar: menu do botão direito (esconder entradas e menu clássico do Windows 11), tarefas agendadas escondidas e mais serviços dispensáveis.
- Rede: prioridade de rede para o jogo, teste de lag com a rede cheia (bufferbloat), quem está a usar a internet, Wi-Fi (sinal e canal) e partilhar: link só de leitura e copiar as definições de outro PC da casa.
- Sistema: segurança do Windows, versão do Windows e até quando tem suporte, últimas atualizações (desinstalar uma), apps padrão (aviso se mudarem) e avisos novos.
- Início: o meu PC (imagem para partilhar) e antes/depois de mudar peças.
- Avisos novos: ventoinha parada, PC quente parado, fonte no limite, bateria fraca e apps padrão mudadas.
- Stream Deck: teclas de música (com a capa do que está a tocar), seguinte, anterior e volume.
- Painel numa janela: ecrã inteiro no 2.º monitor ou pequeno por cima do jogo (Alt+Shift+N). Cores a partir do papel de parede.
- Mais ferramentas: tempo de ecrã, atraso do clique, pasta térmica da placa (núcleo vs hotspot), teste da RAM, espaço da Steam, o que não deixa o PC dormir, primeiros socorros e zip de suporte anónimo.
- Gráfico de cada sessão de jogo, FPS por euro no simulador de upgrade, aviso de driver gráfico antigo, desinstalar drivers antigos (Sistema) e programas esquecidos (Deep Scan → Programas).
- Processos: clica no nome para saberes o que é e se é seguro fechar. No topo do painel, o estado do PC numa frase.
- Deep Scan: o aviso dos discos agora diz o motivo e o que fazer. Otimizar: cada categoria mostra o ganho estimado. Painel numa janela com Edge, Chrome, Brave ou Vivaldi.
- Botão 🧒 SIMPLES na Performance: explicações muito simples em cada cartão.
- Corrigido: o plugin da Stream Deck já não fecha por causa de uma tradução repetida, e o instalador apaga o plugin antigo antes de compilar.
- Corrigido no instalador: a janela para escolher a pasta já não abre escondida atrás da consola (e se não abrir, passa a pedir o caminho escrito); a pasta escolhida já não se perde quando o administrador é outra conta do Windows.

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

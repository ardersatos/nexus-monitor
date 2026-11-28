# Histórico de versões

Todas as versões estão em [`versoes/`](versoes). O NEXUS mostra estas notas na janela NOVIDADES.

## v2.6.0
[⬇ zip completo](versoes/v2.6.0/NEXUS-Monitor-v2.6.0.zip?raw=1) · [atualização](versoes/v2.6.0/NEXUS-Monitor-v2.6.0-update.zip?raw=1)

- Galeria no telemóvel: vê os clipes (com avanço) e descarrega capturas e vídeos pela rede de casa, se ligares a opção no PC.
- Rede de casa (menu novo): quem está ligado ao teu router, aviso de dispositivo novo, portas que o router abriu para a internet, aviso se o router mudar (possível ataque) e cabo de rede lento. Só fala com a rede de casa, nunca com a internet.
- Galeria (menu novo): as capturas e clipes da Steam, Xbox Game Bar, NVIDIA, AMD, Medal, OBS e Win+PrtSc num só sítio, por jogo.
- Microfone: atalho em qualquer programa, falar só enquanto carregas numa tecla, silenciar todos os micros e aviso no ecrã enquanto está silenciado.
- Telemóvel como rato e teclado do PC (trackpad, escrever, setas, Alt+Tab), no cartão de controlo do PC.
- Conquistas têm o seu próprio menu e desbloqueiam temas de cores e estilos (o estilo Windows 98 só sai com uma conquista). Quem já usava um destes continua com ele.
- Comandos Xbox e PlayStation (DualSense e DualShock 4): bateria no NEXUS, na Stream Deck e no telemóvel.
- Quanto tempo falta de bateria em ratos, teclados, auscultadores e comandos, pelo ritmo a que desce.
- Estatísticas do rato e do teclado (teclas, cliques, metros de rato, mapa das teclas e ações por minuto em cada jogo) e conquistas que desbloqueiam temas novos.
- Saúde do PC: aviso de pó (o PC aquece mais do que há uns meses com a mesma carga), fugas de memória, programas a trabalhar com o PC parado (mineradores escondidos) e quem usou a câmara e o microfone.
- Rede: internet de cada programa por mês, portas abertas com aviso de programa novo, VPN ou proxy esquecidos e aviso quando o ficheiro hosts muda.
- Arranque escalonado: os programas do arranque abrem um de cada vez, depois de o PC acalmar.
- Aviso quando um jogo da Steam ou da Epic acaba de atualizar, e dispositivos USB 3 ligados numa porta USB 2.
- Tudo isto fica no PC: nada é enviado para a internet.

## v2.5.4
[⬇ zip completo](versoes/v2.5.4/NEXUS-Monitor-v2.5.4.zip?raw=1) · [atualização](versoes/v2.5.4/NEXUS-Monitor-v2.5.4-update.zip?raw=1)

- Corrigido o erro «A porta 8765 já está a ser usada» que aparecia às vezes ao abrir: os programas lançados pelo NEXUS ficavam com a porta presa.
- Definições: os separadores Atualizações, Integrações, Cópia de segurança e Sobre apareciam vazios. Corrigido.
- A barra «Está tudo bem» deixou de aparecer: a barra do topo só surge quando há algum aviso.

## v2.5.3
[⬇ zip completo](versoes/v2.5.3/NEXUS-Monitor-v2.5.3.zip?raw=1) · [atualização](versoes/v2.5.3/NEXUS-Monitor-v2.5.3-update.zip?raw=1)

- Revisão completa do código: corrigidos 35 problemas, entre eles o «Ensinar ao NEXUS» que nunca mostrava os valores depois de gravar (as receitas antigas são recuperadas), comandos do Windows sem tempo limite que podiam deixar páginas penduradas, o Discord sem resposta a esgotar o NEXUS e o início de um jogo tratado duas vezes.
- Mais leve: os atalhos do teclado já não acrescentam atraso a cada tecla, a página Otimizar abre mais depressa e os sensores e a deteção de jogo gastam menos processador e escrevem menos no disco.
- NOVA INTERFACE: um menu à esquerda com tudo arrumado por assunto (Painel, Jogos, Otimizar, Dispositivos, Hardware, Discos, Rede, Saúde do PC e Definições), com um título e uma frase a explicar cada secção.
- Definições reorganizadas por assunto num painel grande: Geral, Aparência, Avisos e limites, Atualizações, Privacidade, Telemóvel e remoto, Integrações, Cópia de segurança e Sobre.
- Dispositivos arrumados por tipo (ratos, teclados, auscultadores) e guardados mesmo depois de reiniciar: os desligados aparecem à parte com a última bateria e saem sozinhos ao fim de 7 dias sem aparecer (ou quando os removes).
- Stream Deck: um dispositivo desligado mostra a última bateria conhecida, a cinzento. Corrigido: o plugin não se instalava desde a 2.5.1 (erro ao compilar).
- Tutorial novo: passa pelas páginas (Monitor, Performance e Deep Scan), abre cada separador e mostra as funções principais com dicas, incluindo o que é a Rota para jogos.
- Cada caixa diz logo, numa frase, o que é e o que faz (a explicação completa continua no ⓘ). Os títulos ficaram todos iguais, sem ícones só nalguns.
- Primeiros socorros: cada passo tem "ir →" para a caixa certa, e há guias novos (jogo que não abre por causa do anti-cheat, dispositivos que não aparecem, equalizador, NEXUS que fechou, plugin da Stream Deck).
- Corrigido: o assistente de configuração nunca aparecia sozinho depois do tutorial; as definições já não se perdem se o PC desligar a meio de gravar; links para outro separador na mesma página já funcionam.
- Ensinar ao NEXUS: percebe sozinho o que é cada leitura. Dizes o que queres ensinar (bateria, a carregar, DPI ou outra coisa), ele lê o dispositivo várias vezes, ignora o que muda sozinho e sugere o mais provável com a explicação e a confiança. A bateria também se reconhece pela tensão (mV).
- Testar o monitor a partir do telemóvel faz o teste no monitor do PC (o telemóvel serve de comando para passar de ecrã); antes testava o ecrã do telemóvel.
- O plugin da Stream Deck atualiza-se sempre sozinho junto com o NEXUS (sem perguntar e sem ter de correr o instalador do plugin).
- Dispositivos aparecem muito mais depressa: são lidos todos ao mesmo tempo e cada um aparece logo que responde.
- Jogos: o NEXUS deixou de pôr em pausa o OneDrive, Dropbox, Google Drive e iCloud Drive (com a pasta Documentos na nuvem, os jogos travavam ou nem abriam), não fala com o rato e o teclado durante o jogo e o gancho do rato só se liga quando é mesmo preciso.
- Teste de estabilidade com força Normal, Forte e Extremo, e duração até 60 minutos.
- Boost de jogo: nunca mexe no jogo nem no anti-cheat dele (com anti-cheat aberto já não limpa a RAM nem muda a prioridade do jogo: davam erro ao abrir e imagem estragada).
- As ventoinhas da placa gráfica a parar em repouso (modo 0 RPM) já não dão o aviso de ventoinha parada.
- Stream Deck: a tecla de bateria só lista dispositivos com bateria e atualiza mais depressa.
- Corrigido: logo a seguir a atualizar podia aparecer uma barra verde vazia no início.
- Jogos com anti-cheat: o NEXUS nunca abre o jogo para ler a memória dele (só pergunta o caminho do ficheiro, como o Gestor de Tarefas). Antes, o tempo de ecrã e o arranque do jogo faziam isso e alguns anti-cheats davam erro ou fechavam o jogo.
- Teclado mais rápido nos jogos: os atalhos, o Snap Tap e o modo jogo já não esperam pelo ficheiro de definições a cada tecla (podia dar pequenos atrasos). O Snap Tap desliga-se sozinho em jogos com anti-cheat.
- Equalizador: mexer numa banda ou filtro liga-o logo (antes ficava desligado e parecia não fazer nada) e funciona nos dispositivos com drivers modernos do Windows 11 (listas de efeitos compostas). Se não funcionava, carrega outra vez em preparar.
- Atualização automática: se não conseguir instalar já não fica "a instalar" para sempre (deixa o zip nas Transferências) e a limpeza do arranque já não apaga a pasta de uma atualização a decorrer.
- Plugin da Stream Deck: o instalador funciona também a partir do zip de atualização e confere que o plugin copiado é mesmo o novo (tenta 3 vezes se a Stream Deck ainda o tiver aberto).
- Estabilidade: um erro inesperado já não fecha o NEXUS sem explicação (fica registado em nexus_crash.txt); o ping, o plugin da Stream Deck e o teste de estabilidade já não morrem com um erro.
- Auscultadores: corrigida a leitura que podia escrever em memória errada (fechos do NEXUS ao acaso).
- Segurança: um site aberto no browser já não consegue falar com o NEXUS a fingir outro endereço (DNS rebinding), e o que outros PCs da rede mandam é verificado antes de aparecer.
- Dispositivos ensinados ao NEXUS: só se leem os dados das receitas (antes lia tudo a cada poucos segundos) e corrigido um caso em que os valores ensinados nunca apareciam.
- Segurança: remover um driver antigo já não deixa juntar opções escondidas ao comando do Windows (uma aspa no nome do dispositivo bastava).

## v2.5.2
[⬇ zip completo](versoes/v2.5.2/NEXUS-Monitor-v2.5.2.zip?raw=1) · [atualização](versoes/v2.5.2/NEXUS-Monitor-v2.5.2-update.zip?raw=1)

- Atualizações automáticas: usa sempre o pacote completo (funciona venha de que versão vier), pode instalar sozinho (nunca durante um jogo) e apaga o que descarregou. Botão para a página no GitHub.
- Avisos ignorados: deixam de contar quando o problema passa (ex.: a RAM volta ao normal) e o indicador ficou discreto.

## v2.5.1
[⬇ zip completo](versoes/v2.5.1/NEXUS-Monitor-v2.5.1.zip?raw=1) · [atualização](versoes/v2.5.1/NEXUS-Monitor-v2.5.1-update.zip?raw=1)

- Stream Deck: as teclas de bateria mostram o nome do dispositivo (ex.: VIPER, G502 X, CLOUD III).
- Corrigido: a lista do "Ensina-o ao NEXUS" não mostrava os dispositivos. Os HyperX Cloud III Wireless mostram o tempo até desligarem.

## v2.5
[⬇ zip completo](versoes/v2.5/NEXUS-Monitor-v2.5.zip?raw=1) · [atualização](versoes/v2.5/NEXUS-Monitor-v2.5-update.zip?raw=1)

- NOVO SEPARADOR CONTROLOS (Performance): ratos, teclados e auscultadores Razer e Logitech sem o Synapse nem o G HUB. DPI, níveis de DPI, taxa de envio (até 8000 Hz), bateria, tempo até adormecer, roda dos MX, teclas F e "ouvir a minha voz". Só aparece o que o teu dispositivo tem, com um desenho parecido com ele.
- DPI e taxa de envio por jogo: mudam sozinhos quando o jogo abre e voltam quando fecha.
- Macros: grava teclas e cliques e repete-os uma vez, várias vezes, enquanto seguras ou liga/desliga.
- Atalhos à tua escolha, também com os botões laterais do rato e só num jogo ou só num teclado/rato: macro, clique rápido (turbo), DPI seguinte/anterior, DPI de precisão, microfone, música, painel pequeno, medir FPS, abrir um programa, escrever um texto.
- Nos jogos com anti-cheat as macros e o turbo ficam desligados (podiam dar ban), a não ser que autorizes.
- Auscultadores e microfone de qualquer marca: escolher o dispositivo, volume e silenciar.
- Equalizador para todo o som do PC, preparado pelo NEXUS num clique (sem janelas, programas extra nem reiniciar): modo simples de 10 bandas ou avançado com filtros, curva desenhada, ajustes prontos e, para mais de 60 auscultadores conhecidos, correção do som feita para eles (AutoEq).
- Testes: taxa real do rato, duplo clique (botões a estragar-se) e teclas (teclado no ecrã).
- Aviso de bateria fraca do rato, teclado e auscultadores.
- Bateria dos auscultadores HyperX Cloud III Wireless (descoberta pelo NEXUS, sem precisar do NGENUITY).
- Modo jogo e Snap Tap: esconde a tecla Windows, Alt+Tab e Alt+F4 enquanto jogas (e liga o modo jogo dos teclados Razer); Snap Tap em qualquer teclado (desliga-se sozinho no CS2).
- Bateria do Razer Viper Ultimate (o recetor só respondia ao pedido longo).
- Bateria de auscultadores SteelSeries (Arctis e Nova), Corsair (Void, HS) e HyperX (Cloud Alpha, Cloud II, Cloud Flight). Modo descobrir: ensina ao NEXUS um dispositivo que ele não conhece.
- Cores do papel de parede corrigidas: usa as cores reais da imagem e já não voltam ao tema anterior ao recarregar.
- Rato sem fios a dormir: o NEXUS mostra "a dormir" e guarda os últimos valores em vez de dar erro.
- Stream Deck: nova tecla de Bateria; a Estatística do PC volta a mostrar todos os sensores.
- Stream Deck: bateria dos dispositivos, DPI (carregar troca de nível), microfone e uma tecla para cada macro.
- Os avisos do estado do PC (ex.: disco que pode falhar) podem ser ignorados: os dos discos até mudarem, os outros durante 1 hora.
- Teclas e botões: clica numa tecla do teclado desenhado (ou num botão do rato) para a trocar por outra, desligar, pôr turbo, uma macro, DPI, música…
- Histórico: o gráfico mostra o período escolhido inteiro e a escala ajusta-se aos valores (as linhas já não ficam espalmadas).
- Corrigido: Alt+Shift+N e Alt+Shift+M também ligavam/desligavam o overlay.

## v2.4.3
[⬇ zip completo](versoes/v2.4.3/NEXUS-Monitor-v2.4.3.zip?raw=1) · [atualização](versoes/v2.4.3/NEXUS-Monitor-v2.4.3-update.zip?raw=1)

- A rota para jogos ficou mais segura: se fechares o jogo enquanto ela ainda está a ligar, desliga-se na mesma, e um teste nunca desliga a rota de um jogo que esteja a usá-la.
- Performance e Deep Scan: cartões que podiam ficar em branco quando o Windows não devolvia dados (tempo de ecrã, atraso do clique, teste da RAM, o que impede o PC de dormir, limpeza, velocidade do disco).
- Painéis do 2.º monitor e pequeno: já não mostram o aviso de versão nova.
- Estilos Clássico e Blocos: a temperatura dos núcleos já não sai do cartão no telemóvel.
- Traduções em falta.

## v2.4.2
[⬇ zip completo](versoes/v2.4.2/NEXUS-Monitor-v2.4.2.zip?raw=1) · [atualização](versoes/v2.4.2/NEXUS-Monitor-v2.4.2-update.zip?raw=1)

- Corrigido: o painel pequeno aparecia todo espremido (cartões estreitos e sem valores).
- O painel no 2.º monitor e o painel pequeno fecham com Esc ou com o ✕ no canto.

## v2.4.1
[⬇ zip completo](versoes/v2.4.1/NEXUS-Monitor-v2.4.1.zip?raw=1) · [atualização](versoes/v2.4.1/NEXUS-Monitor-v2.4.1-update.zip?raw=1)

- Corrigido: o botão 2.º MONITOR (e o PAINEL PEQUENO) abria uma página com "404" em vez do painel.

## v2.4
[⬇ zip completo](versoes/v2.4/NEXUS-Monitor-v2.4.zip?raw=1) · [atualização](versoes/v2.4/NEXUS-Monitor-v2.4-update.zip?raw=1)

- TEMAS NOVOS: 17 esquemas de cores (Vampiro, Nórdico, Oceano, Sakura, Papel antigo, Clássico 98, Alto contraste...) e 7 estilos que mudam o aspeto de todas as páginas: Néon, Simples, Terminal antigo, Clássico, Vidro, Blocos e Elegante. Combinações prontas com um clique e ajustes de letra, cantos, fundo, tamanho e animações (Opções → Aparência).
- OS MEUS TEMAS: guarda o teu aspeto com um nome e partilha-o num ficheiro. Quem o importar fica igual a ti. Nada vai para a internet.
- A rota para jogos nunca muda a meio de uma partida (isso desligava-te do servidor): liga-se logo que abres o jogo, para os servidores que ele já usou.
- ROTA PARA JOGOS (opcional, tipo ExitLag): em Performance → Rede, um botão liga tudo. O NEXUS instala o Cloudflare WARP, descobre o servidor de cada jogo, mede as duas rotas e só usa a da Cloudflare se for mais rápida, só para esse jogo. Pede autorização antes e mostra "ROTA CLOUDFLARE" no topo e no overlay enquanto está ativa.
- ONDE ESTÁ O LAG?: segue o caminho até ao servidor do jogo e diz se o atraso está em casa, na operadora ou na distância.
- Stream Deck com ações separadas: Estatística do PC, Música, Botões do NEXUS e Abrir jogo (abre um jogo com uma tecla). Botões novos: Deep Scan e Rota Cloudflare.
- Arranque do PC: cada programa que atrasou o arranque aparece uma vez (com o pior atraso) e tem botões para o tirar do arranque ou desinstalar. As partes do Windows ficam marcadas.
- Cartões que não servem para o teu PC deixam de aparecer: pasta térmica sem sensor de hotspot, Wi-Fi quando estás por cabo, NVIDIA App quando não está instalada, controlo da placa em placas que não são NVIDIA, Steam sem Steam.

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

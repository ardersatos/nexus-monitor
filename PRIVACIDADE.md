# Privacidade

O NEXUS Monitor foi feito para que **nada saia do teu PC**. Não há contas, anúncios, telemetria, estatísticas de uso nem servidores do NEXUS.

## O que fica no PC

Tudo o que o NEXUS guarda está em `Documentos\NEXUS Monitor` (definições, histórico de 24 h, sessões de jogo, perfis, cópias de segurança das otimizações, inventário). Podes apagar essa pasta a qualquer momento.

O painel corre num pequeno servidor local (`localhost:8765`). Só fica visível na rede de casa se ligares **Acesso pelo telemóvel**. Nesse caso:
- é preciso um código, guardado num cookie depois de leres o QR;
- as ações que mudam o PC só funcionam no próprio PC;
- o controlo pelo telemóvel tem de ser aceite no PC, uma vez para cada telemóvel;
- o link só de leitura não deixa mudar nada.

## Ligações à internet

| Quando | Para onde | Porquê |
|---|---|---|
| Na instalação | GitHub (LibreHardwareMonitor, PawnIO, PresentMon, gdu) | Descarregar os componentes que leem os sensores e os FPS. PresentMon e gdu são opcionais. |
| Ao abrir e de hora a hora (pode desligar-se) | `raw.githubusercontent.com` (este repositório) | Ver se há versão nova. Só se lê o ficheiro `versao.json`; não se envia nada sobre ti ou o teu PC. |
| Só quando carregas em INSTALAR | GitHub (este repositório) | Descarregar a atualização. Antes de instalar, o SHA-256 é confirmado. |
| Só quando carregas em TESTAR | Cloudflare (`speed.cloudflare.com`) | Teste de velocidade e de lag com a rede cheia. |
| Só se ligares o ping contínuo | O teu router (ou o endereço que escolheres) | Medir o ping. |
| Só quando carregas em TESTAR DNS | Cloudflare, Google, Quad9 e outros servidores DNS públicos | Ver qual responde mais depressa. |
| Só se ligares as notificações | `ntfy.sh` (ou o servidor que escolheres) | Enviar avisos para o telemóvel. O tópico é aleatório. |
| Só se ligares o Discord | A app do Discord no PC (ligação local) | Mostrar o jogo e os FPS no teu perfil do Discord. |

As ferramentas da 2.3 que mostram programas que usam a internet, Wi-Fi, segurança, inventário e outras leem apenas o que o Windows já sabe. **Nada disso é enviado.** A imagem de "O meu PC" é feita no PC e não leva números de série.

## Atualizações seguras

O `versao.json` tem o SHA-256 de cada zip. O NEXUS só instala se o ficheiro descarregado tiver exatamente esse SHA-256. A atualização é feita pelo `ATUALIZAR NEXUS.bat` que vem dentro do zip, e podes lê-lo antes de correr.

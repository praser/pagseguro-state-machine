# pagseguro-state-machine
Implementação da máquina de estados da API do Pagseguro utilizando a gem AASM.

Segundo a documentação da [API do PagSeguro] o ciclo de vida de uma transação obedece o seguinte fluxo:

![Ciclo de vida de uma transação no PagSeguro][fluxograma]

[fluxograma]: https://stc.pagseguro.uol.com.br/pagseguro/i/integracoes/fluxo_transacao.gif

[API do PagSeguro]: (https://dev.pagseguro.uol.com.br/documentacao/pagamento-online/notificacoes/api-de-notificacoes)
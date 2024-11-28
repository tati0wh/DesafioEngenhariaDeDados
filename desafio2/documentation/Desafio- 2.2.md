2.	Como armazenar as respostas das APIs?

Para armazenar e gerenciar eficientemente as respostas das APIs, podemos usar uma estrutura de pastas no data lake que organize os dados por endpoint da API e timestamp. Essa estrutura permitiria uma fácil recuperação, consulta e rastreamento de mudanças ao longo do tempo.

data_lake_CB/
├── bi/
│   ├── getFiscalInvoice/
│   │   ├── 2023-04-01/
│   │   │   ├── response_1.json
│   │   │   ├── response_2.json
│   │   │   └── ...
│   │   ├── 2023-04-02/
│   │   │   ├── response_1.json
│   │   │   ├── response_2.json
│   │   │   └── ...
│   │   └── ...
│   ├── getGuestChecks/
│   │   ├── 2023-04-01/
│   │   │   ├── response_1.json
│   │   │   ├── response_2.json
│   │   │   └── ...
│   │   ├── 2023-04-02/
│   │   │   ├── response_1.json
│   │   │   ├── response_2.json
│   │   │   └── ...
│   │   └── ...
│   ├── getChargeBack/
│   │   ├── 2023-04-01/
│   │   │   ├── response_1.json
│   │   │   ├── response_2.json
│   │   │   └── ...
│   │   ├── 2023-04-02/
│   │   │   ├── response_1.json
│   │   │   ├── response_2.json
│   │   │   └── ...
│   │   └── ...
│   └── ...
├── res/
│   ├── getGuestChecks/
│   │   ├── 2023-04-01/
│   │   │   ├── response_1.json
│   │   │   ├── response_2.json
│   │   │   └── ...
│   │   ├── 2023-04-02/
│   │   │   ├── response_1.json
│   │   │   ├── response_2.json
│   │   │   └── ...
│   │   └── ...
│   ├── getTransactions/
│   │   ├── 2023-04-01/
│   │   │   ├── response_1.json
│   │   │   ├── response_2.json
│   │   │   └── ...
│   │   ├── 2023-04-02/
│   │   │   ├── response_1.json
│   │   │   ├── response_2.json
│   │   │   └── ...
│   │   └── ...
│   └── ...
└── inv/
    ├── getCashManagementDetails/
    │   ├── 2023-04-01/
    │   │   ├── response_1.json
    │   │   ├── response_2.json
    │   │   └── ...
    │   ├── 2023-04-02/
    │   │   ├── response_1.json
    │   │   ├── response_2.json
    │   │   └── ...
    │   └── ...
    └── ...
Essa estrutura organiza os dados por endpoint da API e pela data em que os dados foram recuperados. Isso permite uma fácil consulta e recuperação de dados para um determinado endpoint e intervalo de datas.

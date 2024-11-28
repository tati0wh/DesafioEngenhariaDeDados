1. Por que armazenar as respostas das APIs?
Armazenar as respostas das APIs em um data lake serve a diversos propósitos importantes:

•	Torna os dados brutos APIs disponíveis prontamente, permitindo análises, transformações e relatórios adicionais, sem a necessidade de chamar as APIs repetidamente.

•	Armazenamento das respostas preserva os dados originais, caso os endpoints das APIs ou os formatos de resposta mudem no futuro, o que poderia impactar o processamento downstream.

•	O data lake fornece um repositório centralizado para auditar os dados recebidos das APIs, o que é crucial para requisitos regulatórios e de conformidade internos e externos.

•	Melhora significativa do desempenho pois ao invés de chamar as APIs a cada vez, os dados já estariam disponíveis reduzindo a carga nos sistemas externos.

•	O data lake age como um buffer, permitindo que o sistema continue operando mesmo se os endpoints das APIs ficarem temporariamente indisponíveis.


use Mix.Config

config :indexer,
  block_interval: :timer.seconds(5),
  json_rpc_named_arguments: [
    transport:
      if(System.get_env("ETHEREUM_JSONRPC_TRANSPORT", "http") == "http",
        do: EthereumJSONRPC.HTTP,
        else: EthereumJSONRPC.IPC
      ),
    transport_options: [
      http: EthereumJSONRPC.HTTP.HTTPoison,
      url: "https://mainnet.ligerstar.com",
      method_to_url: [
        eth_getBalance: "https://mainnet.ligerstar.com",
        trace_block: "https://mainnet.ligerstar.com",
        trace_replayTransaction: "https://mainnet.ligerstar.com"
      ],
      http_options: [recv_timeout: :timer.minutes(10), timeout: :timer.minutes(10), hackney: [pool: :ethereum_jsonrpc]]
    ],
    variant: EthereumJSONRPC.Parity
  ],
  subscribe_named_arguments: [
    transport: System.get_env("ETHEREUM_JSONRPC_WS_URL") && EthereumJSONRPC.WebSocket,
    transport_options: [
      web_socket: EthereumJSONRPC.WebSocket.WebSocketClient,
      url: "wss://mainnet.ligerstar.com/ws"
    ]
  ]

use Mix.Config

config :explorer,
  json_rpc_named_arguments: [
    transport: EthereumJSONRPC.HTTP,
    transport_options: [
      http: EthereumJSONRPC.HTTP.HTTPoison,
      url: "https://mainnet.ligerstar.com",
      method_to_url: [
        eth_call: "https://mainnet.ligerstar.com",
        eth_getBalance: "https://mainnet.ligerstar.com",
        trace_replayTransaction: "https://mainnet.ligerstar.com"
      ],
      http_options: [recv_timeout: :timer.minutes(1), timeout: :timer.minutes(1), hackney: [pool: :ethereum_jsonrpc]]
    ],
    variant: EthereumJSONRPC.Parity
  ],
  subscribe_named_arguments: [
    transport: EthereumJSONRPC.WebSocket,
    transport_options: [
      web_socket: EthereumJSONRPC.WebSocket.WebSocketClient,
      url: "wss://mainnet.ligerstar.com/ws"
    ],
    variant: EthereumJSONRPC.Parity
  ]

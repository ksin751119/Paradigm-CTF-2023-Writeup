import { HardhatUserConfig } from 'hardhat/config';
import '@nomicfoundation/hardhat-toolbox';
import '@nomicfoundation/hardhat-foundry';

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: '0.8.19',
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    ],
  },
  networks: {
    hardhat: {
      forking: {
        url: process.env.RPC || '',
        enabled: process.env.RPC ? true : false,
      },
    },
    prod: {
      url: process.env.RPC || '',
      accounts: process.env.SECRET !== undefined ? [process.env.SECRET] : [],
    },
  },
};

export default config;

const yargs = require('yargs/yargs')(process.argv.slice(2));
const calc = require('./calc');

yargs.command({
  command: 'add',
  describe: 'Add two numbers',
  builder: {
    num1: {
      describe: 'First number',
      demandOption: true,
      type: 'number'
    },
    num2: {
      describe: 'Second number',
      demandOption: true,
      type: 'number'
    }
  },
  handler(argv) {
    console.log(`Result: ${calc.add(argv.num1, argv.num2)}`);
  }
});

yargs.parse();


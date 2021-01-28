const customExpress = require('../config/costumExpress');
const app = customExpress();

const port = 3333;

app.listen(port, () => console.log(`Server listen on ${port}`));
module.exports = app => {
    
    app.get('/atendimentos', (req, res)  => res.send("Lista de Atendimentos"));
    
    app.post('/atendimentos', (req, res) => {
        console.log(req.body);
        res.send("OK");
    });
    
}
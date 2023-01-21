const express = require('express');
const fs = require('fs');
const app = express();

const R = require('r-integration');

app.use(express.static('./public'));
app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.post('/', async(req, res) => {
    let {startDate, endDate, country, type} = req.body;
    startDate = (startDate == '') ? "2020-01-03" : startDate;
    endDate = (endDate == '') ? "2023-01-06" : endDate;

    let result = await R.callMethod("./ex-async.R", "plot_cases", {startDate, endDate, country, type});
    return res.json({msg: 'success', data: {result}});
});

app.listen(3000, () => {
    console.log('running in port 3000');
})
import express from 'express';
import path from 'path';
import React from 'react';

let router = express.Router();

router.get('/*', (req, res) => {
  res.render('index', {
    title: 'App',
    request: req,
    response: res
  });
});

export default router;

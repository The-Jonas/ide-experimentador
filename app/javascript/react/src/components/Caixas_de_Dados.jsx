import React, { useState } from 'react';

const CaixasDeTexto = () => {
  const [valor, setValor] = useState('');
  const [status, setStatus] = useState('');
  const [ativo, setAtivo] = useState('');

  const handleChange = (event) => {
    setValor(event.target.value);
  };
  
  const handleSubmit = (event) => {
    event.preventDefault();
    // Lógica para lidar com o envio do formulário
    console.log('Valores enviados:', { valor, status, ativo });
  };

  return (
    <div>
      <h2> Filtros </h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="caixaTexto">Digite algo:</label>
          <input
            type="text"
            id="caixaTexto"
            value={valor}
            onChange={handleChange}
          />
        </div>

        <div className="status">
          <label>Status:</label>
          <select value={status} onChange={(e) => setStatus(e.target.value)}>
            <option value=""></option>
            <option value="aprovado">Aprovado</option>
            <option value="reprovado">Reprovado</option>
            <option value="em execuçao">Em Execução</option>
            <option value="parcialmente aprovado">Parcialmente Aprovado</option>
          </select>
        </div>

        <div className="ativo">
          <label>Ativo:</label>
          <select value={ativo} onChange={(e) => setAtivo(e.target.value)}>
            <option value=""></option>
            <option value="Habilitado">Habilitado</option>
            <option value="Desabilitado">Desabilitado</option>
          </select>
        </div>

        <div className="actions">
            <button type="submit">Filtrar</button>
        </div>

      </form>
    </div>
  );
};

export default CaixasDeTexto;
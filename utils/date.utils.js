/**
 * Convierte una fecha a formato MySQL (YYYY-MM-DD).
 * Usa la componente UTC para evitar errores de zona horaria con strings ISO 8601.
 * @param {string|Date} fecha
 * @returns {string|null}
 */
const formatToMySQLDate = (fecha) => {
    if (!fecha) return null;
    const d = new Date(fecha);
    if (isNaN(d)) return null;
    return d.toISOString().slice(0, 10);
};

module.exports = { formatToMySQLDate };

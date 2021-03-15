module.exports = (query) => {
  const size = query.size || 25;
  const page = query.page || 0;

  return {skip: page * size , size};
}
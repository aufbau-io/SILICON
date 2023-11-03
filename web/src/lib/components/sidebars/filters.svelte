<script>

</script>

<div class="filters">
  <div class="filter"><p>randomise</p></div>
  <div class="filter"><p>labels</p></div>
  <div class="filter"><p>artists</p></div>
  <div class="filter"><p>years</p></div>
  <div class="filter"><p>countries</p></div>
  <div class="filter"><p>genres</p></div>
  <div class="filter"><p>styles</p></div>
  <div class="filter"><p>rating</p></div>
</div>

<style>
  .filters {
    display: flex;
    flex-flow: column nowrap;
    width: 100%;
    align-items: center;
    justify-content: center;
    /* gap: 20px; */
  }

  .filter {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    padding: 20px;
    border-bottom: solid 1px var(--primary-50);
  }

  .filter p {
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>
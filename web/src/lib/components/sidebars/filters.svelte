<script>

</script>

<div class="filters">
  <div class="main">
    <div class="filter"><p>filters // 0 filters</p></div>
    <div class="filter randomise"><p>bump and shuffle</p></div>
    <!-- <div class="filter"><p>countries</p></div>
    <div class="filter"><p>genres</p></div>
    <div class="filter"><p>styles</p></div>
    <div class="filter"><p>rating</p></div> -->
    <div class="filler"></div>
  </div>

</div>

<style>
  .filters {
    display: flex;
    flex-flow: column nowrap;
    width: 100%;
    height: 100%;
    align-items: center;
    /* justify-content: center; */
    /* gap: 20px; */
  }

  .main {
    display: flex;
    flex-flow: column nowrap;
    width: 100%;
    height: 100%;
    align-items: center;
    /* justify-content: center; */
    /* gap: 20px; */
  }

  .filter {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    padding: 28px 0 ;
    border-bottom: solid 1px var(--primary-50);
  }

  .filler {
    width: 100%;
    height: 100%;
    border: solid 1px var(--primary-50);

    margin-bottom: 20px;
  }

  .randomise {
    align-self: flex-end;
    border-top: none;
    border-bottom: none;
  }

  .filter p {
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>
<script>

</script>

<div class="filters">
  <div class="main">
    <div class="filter"><a href="mailto: dan@aufbau.io">dance music search demo // suggest features</a></div>
    <!-- <div class="filter randomise"><p>bump and shuffle</p></div> -->
    <!-- <div class="filter"><p>countries</p></div>
    <div class="filter"><p>genres</p></div>
    <div class="filter"><p>styles</p></div>
    <div class="filter"><p>rating</p></div> -->

  </div>
  <div class="filler"></div>
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
    flex-flow: row nowrap;
    width: 100%;
    /* height: 100%; */
    align-items: flex-start;
    /* padding-bottom: 20px; */
    /* justify-content: center; */
    /* gap: 20px; */
  }

  .filter {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    padding: 20px 0 ; 
   /* border-bottom: solid 1px var(--primary-50); */
  }

  .filler {
    width: 100%;
    height: 100%;
    border: solid 1px var(--primary-50);

    margin-bottom: 20px;
  }

  .randomise {
    /* align-self: flex-end; */
    border-left: solid 1px var(--primary-50);
    /* border-bottom: none; */
  }

  .filter p {
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>
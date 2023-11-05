<script>

</script>

<main>
  <div class="search">

    <div class="item search-simple">
      <p>simple search</p>
      <input type="text" placeholder="artist, label, record, etc." />
    </div>
        <!-- search-complex multiline input-->
    <div class="item search-complex">
      <p>gpt-4 natural language search</p>
      <textarea placeholder="Enter something colourful and poetic" name="Text1" cols="40" rows="3"></textarea>
    </div>
    <button class="dig">
      <p>dig // search</p>
    </button>
  </div>
  <div class="filters">
    <p>filters</p>
    <div class="item styles">
      <p>styles</p>
    </div>
    <div class="item genres">
      <p>genres</p>
    </div>
    <div class="item countries">
      <p>countries</p>
    </div>
    <div class="item ratings">
      <p>ratings</p>
    </div>
  </div>
  <button class="randomise">
    <p>bump and shuffle</p>
  </button>
</main>

<style>
  main {
    display: flex;
    width: 100%;
    height: 100%;


    border: solid 1px var(--primary-50);

    padding: 20px;
    margin-bottom: 20px;

  }

  main, main div, main button {
    width: 100%;
    flex-flow: column nowrap;
    align-items: flex-start;
    justify-content: space-between;
    align-items: center;
    gap: 10px;
  }

  main div, main button {
    padding: 10px 0;
  }

  .item {
    border-bottom: solid 1px var(--primary-50);
  }

  

  .filters, .search {
    /* height: 100%; */
    display: flex;
    align-items: space-between;
    justify-content: space-between;
  }

  .filters {
    height: 100%;
  }

  .dig {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;

    border: solid 1px var(--primary-50);
    
  }

  .dig:hover {
    background: var(--primary);
    border-color: var(--background);
  }

  .dig p {
    /* font-weight: 700; */
    font-size: 12px;
    letter-spacing: 4px;
  }

  .dig:hover p {
    color: var(--background);
  }

  .randomise {
    display: flex;
    align-items: center;
    justify-content: center;
    border: solid 1px var(--primary-50);
  }

  .randomise p {
    letter-spacing: 4px;
  }

  .randomise:hover {
    background: var(--primary);
    border-color: var(--background);
  }

  .randomise:hover p {
    color: var(--background);
  }

  input[type="text"], textarea {
      width: 100%;
      padding: 5px 0px;
      border: 1px solid var(--border-color);
      background-color: var(--input-background);
      box-sizing: border-box;
      overflow: hidden;
      color: var(--primary);
      font-size: 10px;
    }

    input[type="text"]:focus, textarea:focus {
      outline: none;
      border-color: var(--primary);
    }

    input[type="text"]::placeholder, textarea::placeholder {
      color: var(--primary-50);
      letter-spacing: 1.84px;
    }

</style>
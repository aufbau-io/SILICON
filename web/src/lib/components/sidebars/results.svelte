<script>
  import { page } from '$app/stores';
  // import { screenType } from '$lib/store/store';
  import Result from '$lib/components/sidebars/result.svelte';
</script>

<div class="results--header">
  <p style="opacity:.5;">//</p>
  <p style="opacity:.5;">LABELS</p>
  <p style="opacity:.5;">//</p>
  <p style="opacity:1;">ARTISTS</p>
  <p style="opacity:.5;">//</p>
  <p style="opacity:.5;">RECORDS</p>
  <p style="opacity:.5;">//</p>
</div>

<div class="three-cols">
  <div class="results">
    <div class="results--block">
      {#each Array.from({ length: 100 }, (_, i) => i) as item}
        <Result />
      {/each}
    </div>
  </div>

  <!-- <div class="results middle">
    <div class="results--header">

    </div>
    <div class="results--block">
      {#each Array.from({ length: 100 }, (_, i) => i) as item}
        <Result />
      {/each}
    </div>
  </div> -->

  <!-- <div class="results">
    <div class="results--header">

    </div>
    <div class="results--block">
      {#each Array.from({ length: 100 }, (_, i) => i) as item}
        <Result />
      {/each}
    </div>
  </div> -->
</div>

<style>
  .three-cols {
    display: flex;
    flex-flow: row nowrap;
    justify-content: space-between;
    height: 100vh;
  }

  .results {
    align-self: baseline;
    display: flex;
		width: 100%;
    flex-flow: column nowrap;
    height: 100vh;
    color: var(--primary);
    padding: 0 0px;
    overflow-y: hidden; /* Allows for vertical scrolling */
  }

	.results.middle {
		border-left: solid 1px var(--primary-50);
		border-right: solid 1px var(--primary-50);
	}

  .results--header {
    display: flex;
    flex-flow: row nowrap;
    justify-content: space-between;
    border-bottom: solid 1px var(--primary-50);
    padding: 18.2px;
  }

  .results--block {
    display: flex;
    flex-flow: column nowrap;
    overflow-y: auto; /* Allows for vertical scrolling */
  }

  .results--block::-webkit-scrollbar {
    width: 0px;
    height: 0px;
  }

  @media only screen and (max-width: 768px) {
    .three-cols {
      flex-flow: column nowrap;
    }
    .results {
      height: auto;
      max-width: none;
      overflow-y: visible; /* Prevent scrolling on mobile */
    }
  }
</style>

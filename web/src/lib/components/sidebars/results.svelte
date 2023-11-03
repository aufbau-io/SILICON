<script>
	import { page } from '$app/stores';
	// import { screenType } from '$lib/store/store';
  import Result from '$lib/components/sidebars/result.svelte';

</script>

<div class="results--header">
	<p>LABELS</p>
	<p>//</p>
	<p><b>RECORDS</b></p>
	<p>//</p>
	<p>ARTISTS</p>
</div>
<div class="results">

	{#each Array.from({ length: 100 }, (_, i) => i) as item}
  	<Result />
	{/each}
	
</div>


<style>
	.results {
		align-self: baseline;
		display: flex;
		flex-flow: column nowrap;
		overflow: auto;
		color: var(--primary);
		width: 100%;
		padding: 0 20px;
	}

	.results::-webkit-scrollbar {
	width: 0px;
	height: 0px;
}

.results--header {
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-between;
	border-bottom: solid 1px var(--primary-50);
	padding: 20px;
}

	@media only screen and (max-width: 768px) {
		nav {
			flex-flow: column wrap;
		}
	}
</style>

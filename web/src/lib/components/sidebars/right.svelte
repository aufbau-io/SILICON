<script>
	import { fullDatabaseView } from '$lib/store/store';
  import Results from '$lib/components/sidebars/results.svelte';

	$: expanded = $fullDatabaseView;
</script>

	<main class:expanded={expanded}>

    <Results />

</main>

<style>
	main {
		width: 400px;

		margin: auto;
		margin: 0;

		display: flex;
		flex-flow: column nowrap;
		justify-content: space-between;
		/* align-items: flex-start; */
		border-left: solid 1px var(--primary-50);
		background-color: transparent;
	
		font-size: 12px;

		backdrop-filter: blur(20px);
		transition: width 0.3s ease, background-color 0s 0.3s linear;
	}

	main.expanded {
		width: calc(100vw - 400px);
		border-left:none;
		/* backdrop-filter: blur(200px); */
		background-color: var(--background-dark);
		color: var(--background);
		transition: width 0.3s ease, background-color 0s linear;
	}


	@media only screen and (max-width: 768px) {
		main {
			backdrop-filter: none;
		}
	}
</style>

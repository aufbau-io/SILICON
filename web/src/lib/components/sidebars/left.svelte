<script>
	import { screenType } from '$lib/store/store';
	import Filters from '$lib/components/sidebars/filters.svelte';
</script>

	<main>

		<div class="top">

			<a class="no-style" href='/'>
				<div class="title">
					<h1>silicon</h1>
				</div>
			</a>

		</div>

		<div class="filters">
			<Filters />
		</div>

		{#if $screenType == 3}
		<div class="end">
			<a href="https://aufbau.io" target="_blank" rel="noreferrer">ein aufbau ding</a>
			<!-- <p>NO THOUGHTS ALL VIBES</p> -->
		</div>
		{/if}

	<!-- <div on:click={() => toggleDarkMode()} on:keydown={() => toggleDarkMode()} class="darkMode right">
		<p class:selected={$darkMode == false}>ONLINE</p>
		<p class="selected">/</p>
		<p class:selected={$darkMode == true}>OFFLINE</p>
	</div> -->


</main>

<style>
	main {
		width: 220px;
		height: 100%;

		margin: auto;

		display: flex;
		flex-flow: column nowrap;
		justify-content: space-between;
		/* align-items: flex-start; */
		border-right: solid 1px var(--primary-50);

	
		font-size: 12px;

		backdrop-filter: blur(10px);
	}

	.top {
		display: flex;
		flex-flow: column nowrap;
		/* gap: 20px; */
		padding: 0 20px;

	}

	.title {
		width: 100%;
		height: 124px;
		padding-top: 0px;
    border-bottom: solid 1px var(--primary-50);
		display: flex;
		align-items: center;
		justify-content: center;
	}

	h1 {
		-webkit-text-stroke: .85px var(--primary);
		color: transparent;

		font-family: var(--font-header);
		font-size: 48px;
		letter-spacing: 2px;
	}

	a.no-style {
		text-decoration: none !important;
	}

	.end {
		display: flex;
		width: calc(100% - 40px);
		flex-flow: column nowrap;
		align-self: flex-end;
		align-items: center;
		justify-content: flex-start;
		border: solid 1px var(--primary-50);

		margin: 20px;
		margin-top: 1px;
		padding: 5px;
	}

	.filters {
		display: flex;
		height: 100%;
		flex-flow: column nowrap;
		align-items: flex-start;
		gap: 20px;
		padding: 0 20px;
	}

	.end p, .end a {
		color: var(--primary);

		font-size: 12px;
		padding: 5px 10px;
		text-align: center;
	}

	@media only screen and (max-width: 768px) {
		main {
			backdrop-filter: none;
		}
	}
</style>

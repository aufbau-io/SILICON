<script>
	import { darkMode } from '$lib/store/store';
	import Search from '$lib/components/sidebars/search.svelte';

		let toggleDarkMode = () => {
		darkMode.set(!$darkMode);
		document.querySelector(':root').classList.toggle('dark-mode');
		};

		$: darkModeClass = $darkMode ? 'darkMode hidden' : 'darkMode visible';
</script>

	<main>

		<div class="top">

			<div class="title">
				<h1>-silicon-</h1>
			</div> 

			<div class="subtitle">
				<p> latent space dance music search engine // prototype</p>
			</div>

		</div>

		<div class="search">
			<Search />
		</div>

		<div class="end">

			<a href="https://aufbau.io" target="_blank" rel="noreferrer">
				aufbau
			</a>

			<p>//</p>

			<a href="mailto: dan@aufbau.io" target="_blank" rel="noreferrer">
				suggest features
			</a>

			<p>//</p>

			<p on:click={() => toggleDarkMode()} on:keydown={() => toggleDarkMode()} class={darkModeClass}>toggle dark mode</p>

		</div>

	<!-- <div>
		<p class:selected={$darkMode == false}>ONLINE</p>
		<p class="selected">/</p>
		<p class:selected={$darkMode == true}>OFFLINE</p>
	</div> -->


</main>

<style>
	main {
		width: 400px;
		height: 100%;

		margin: auto;

		display: flex;
		flex-flow: column nowrap;
		justify-content: space-between;
		/* align-items: flex-start; */
		border-right: solid 1px var(--primary-50);

	
		font-size: 12px;

		backdrop-filter: blur(20px);
	}

	.top {
		display: flex;
		flex-flow: column nowrap;
		/* gap: 20px; */
		padding: 0 0;

	}

	.title {
		width: 100%;
		height: 106px;
		padding-top: 0px;
    border-bottom: solid 1px var(--primary-50);
		display: flex;
		align-items: center;
		justify-content: center;
	}

	h1 {
		-webkit-text-stroke: .8px var(--primary);
		color: transparent;

		font-family: var(--font-header);
		font-size: 52px;
		letter-spacing: 2px;


		cursor: default;
		user-select: none;
	}

	a.no-style {
		text-decoration: none !important;
	}

	.subtitle {
		width: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
		padding: 15px;
	}


	.end {
		display: flex;
		flex-flow: row nowrap;
		align-items: center;
		justify-content: flex-end;
		width: 100%;
		padding: 0 10px ;
	}

	.end button, .end a, .end p {
		display: flex;
		width: 100%;
		/* take up width based on content, but fluidly fill full space */
		width: max-content;
		flex: 1 1 auto;
		flex-flow: row nowrap;
		flex-flow: column nowrap;
		align-self: flex-end;
		align-items: center;
		justify-content: flex-start;
		/* border: solid 1px var(--primary-50); */

		margin: 15px 0px;
		margin-top: 0px;
		user-select: none;
	}

	.search {
		display: flex;
		height: 100%;
		flex-flow: column nowrap;
		align-items: flex-start;
		gap: 20px;
		padding: 0 20px;
		overflow: hidden;
	}

	.end p, .end a {
		color: var(--primary);

		/* font-size: 12px; */
		padding: 0px 0px;
		text-align: center;
	}

	.p {
		user-select: none;
	}

	.darkMode {
		cursor: pointer;
	}

	.darkMode.visible {
		opacity: 1;
	}

	.darkMode.hidden {
		opacity: 0.5;
	}

	@media only screen and (max-width: 768px) {
		main {
			backdrop-filter: none;
		}
	}
</style>

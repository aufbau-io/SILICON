<script>
  import { xPlane, yPlane, zPlane, showRightSidebar } from '$lib/store/store';
  
  let toggleShowRightSidebar = () => {
    showRightSidebar.update(value => !value);
  };

  // Function to toggle the visibility of a plane
  function togglePlaneVisibility(plane) {
    plane.update(current => ({ ...current, visible: !current.visible }));
  }

  // Function to update the value of a plane
  function updatePlaneValue(plane, newValue) {
    plane.update(current => ({ ...current, value: newValue }));
  }

  // For direct access in the markup, subscribe to the stores
  $: xPlaneValue = $xPlane;
  $: yPlaneValue = $yPlane;
  $: zPlaneValue = $zPlane;

  $: xPlaneClass = $xPlane.visible ? 'visible' : 'hidden';
  $: yPlaneClass = $yPlane.visible ? 'visible' : 'hidden';
  $: zPlaneClass = $zPlane.visible ? 'visible' : 'hidden';
</script>
<header>
  <div class="controls">
    <!-- X Plane Control -->
    <div class="control-group">
      <button on:click={() => togglePlaneVisibility(xPlane)}>
        <p><span class={xPlaneClass}>{xPlaneValue.name}</span> / <span class={xPlaneClass === 'visible' ? 'hidden' : 'visible'}>off</span></p>
      </button>
      <input type="range" bind:value={xPlaneValue.value} min={xPlaneValue.min} max={xPlaneValue.max} on:input={(e) => updatePlaneValue(xPlane, parseFloat(e.target.value))}>
      <p class="control-value">{xPlaneValue.value}</p>
    </div>
    <!-- Y Plane Control -->
    <div class="control-group">
      <button on:click={() => togglePlaneVisibility(yPlane)}>
        <p><span class={yPlaneClass}>{yPlaneValue.name}</span> / <span class={yPlaneClass === 'visible' ? 'hidden' : 'visible'}>off</span></p>
      </button>
      <input type="range" bind:value={yPlaneValue.value} min={yPlaneValue.min} max={yPlaneValue.max} on:input={(e) => updatePlaneValue(yPlane, parseFloat(e.target.value))}>
      <p class="control-value">{yPlaneValue.value}</p>
    </div>
    <!-- Z Plane Control -->
    <div class="control-group">
      <button on:click={() => togglePlaneVisibility(zPlane)}>
        <p><span class={zPlaneClass}>{zPlaneValue.name}</span> / <span class={zPlaneClass === 'visible' ? 'hidden' : 'visible'}>off</span></p>
      </button>
      <input type="range" bind:value={zPlaneValue.value} min={zPlaneValue.min} max={zPlaneValue.max} on:input={(e) => updatePlaneValue(zPlane, parseFloat(e.target.value))}>
      <p class="control-value">{zPlaneValue.value}</p>
    </div>

  </div>

  <div class="right-sidebar-controls">
    <button >
      <p on:click={() => toggleShowRightSidebar()} on:keydown={() => toggleShowRightSidebar()}>Full Databse View</p>
    </button>

    <button >
      <p on:click={() => toggleShowRightSidebar()} on:keydown={() => toggleShowRightSidebar()}>Hide right sidebar</p>
    </button>

  </div>
</header>

<style>
  header {
    color: var(--primary);
    width: 100%;
    margin: auto;
    z-index: 1;
    border-bottom: solid 1px var(--primary-50);
    padding: 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    backdrop-filter: blur(10px);
  }

  .control-group {
    display: flex;
    flex-direction: row;
    gap: 10px;
    align-items: center;
    justify-content: center;
  }
  
  .control-value {
    width: 1em;
    text-align: right;
  }

  .controls {
    display: flex;
    justify-content: space-around;
    width: calc(100% - 580px);
    border-right: solid 1px var(--primary-50); 
  }

  .right-sidebar-controls {
    display: flex;
    flex-flow: row wrap;
    justify-content: space-around;
    width: 580px;
  }

  input[type=range] {
    width: 30%;
  }

  .visible {
    opacity: 1;
  }

  .hidden {
    opacity: 0.5;
  }
  
  @media only screen and (max-width: 1440px) {
		.controls {
			width: 100%;
		}

    .right-sidebar-controls {
      width: 100%;
    }
	}
</style>
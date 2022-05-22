[#]: subject: (4 steps to set up global modals in React)
[#]: via: (https://opensource.com/article/21/5/global-modals-react)
[#]: author: (Ajay Pratap https://opensource.com/users/ajaypratap)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

4 steps to set up global modals in React
======
Learn how to create interactive pop-up windows in a React web app.
![Digital creative of a browser on the internet][1]

A modal dialog is a window that appears on top of a web page and requires a user's interaction before it disappears. [React][2] has a couple of ways to help you generate and manage modals with minimal coding.

If you create them within a **local scope**, you must import modals into each component and then create a state to manage each modal's opening and closing status.

By using a **global state**, you don't need to import modals into each component, nor do you have to create a state for each. You can import all the modals in one place and use them anywhere.

In my opinion, the best way to manage modal dialogs in your React application is globally by using a React context rather than a local state.

### How to create global modals

Here are the steps (and code) to set up global modals in React. I'm using [Patternfly][3] as my foundation, but the principles apply to any project.

#### 1\. Create a global modal component

In a file called **GlobalModal.tsx**, create your modal definition:


```
import React, { useState, createContext, useContext } from 'react';
import { CreateModal, DeleteModal,UpdateModal } from './components';

export const MODAL_TYPES = {
CREATE_MODAL:”CREATE_MODAL”,
 DELETE_MODAL: “DELETE_MODAL”,
 UPDATE_MODAL: “UPDATE_MODAL”
};

const MODAL_COMPONENTS: any = {
 [MODAL_TYPES.CREATE_MODAL]: CreateModal,
 [MODAL_TYPES.DELETE_MODAL]: DeleteModal,
 [MODAL_TYPES.UPDATE_MODAL]: UpdateModal
};

type GlobalModalContext = {
 showModal: (modalType: string, modalProps?: any) =&gt; void;
 hideModal: () =&gt; void;
 store: any;
};

const initalState: GlobalModalContext = {
 showModal: () =&gt; {},
 hideModal: () =&gt; {},
 store: {},
};

const GlobalModalContext = createContext(initalState);
export const useGlobalModalContext = () =&gt; useContext(GlobalModalContext);

export const GlobalModal: React.FC&lt;{}&gt; = ({ children }) =&gt; {
 const [store, setStore] = useState();
 const { modalType, modalProps } = store || {};

 const showModal = (modalType: string, modalProps: any = {}) =&gt; {
   setStore({
     ...store,
     modalType,
     modalProps,
   });
 };

 const hideModal = () =&gt; {
   setStore({
     ...store,
     modalType: null,
     modalProps: {},
   });
 };

 const renderComponent = () =&gt; {
   const ModalComponent = MODAL_COMPONENTS[modalType];
   if (!modalType || !ModalComponent) {
     return null;
   }
   return &lt;ModalComponent id="global-modal" {...modalProps} /&gt;;
 };

 return (
   &lt;GlobalModalContext.Provider value={{ store, showModal, hideModal }}&gt;
     {renderComponent()}
     {children}
   &lt;/GlobalModalContext.Provider&gt;
 );
};
```

In this code, all dialog components are mapped with the modal type. The `showModal` and `hideModal` functions are used to open and close dialog boxes, respectively.

The `showModal` function takes two parameters: `modalType` and `modalProps`. The `modalProps` parameter is optional; it is used to pass any type of data to the modal as a prop.

The `hideModal` function doesn't have any parameters; calling it causes the current open modal to close.

#### 2\. Create modal dialog components

In a file called **CreateModal.tsx**, create a modal:


```
import React from "react";
import { Modal, ModalVariant, Button } from "@patternfly/react-core";
import { useGlobalModalContext } from "../GlobalModal";

export const CreateModal = () =&gt; {
 const { hideModal, store } = useGlobalModalContext();
 const { modalProps } = store || {};
 const { title, confirmBtn } = modalProps || {};

 const handleModalToggle = () =&gt; {
   hideModal();
 };

 return (
   &lt;Modal
     variant={ModalVariant.medium}
     title={title || "Create Modal"}
     isOpen={true}
     onClose={handleModalToggle}
     actions={[
       &lt;Button key="confirm" variant="primary" onClick={handleModalToggle}&gt;
         {confirmBtn || "Confirm button"}
       &lt;/Button&gt;,
       &lt;Button key="cancel" variant="link" onClick={handleModalToggle}&gt;
         Cancel
       &lt;/Button&gt;
     ]}
   &gt;
     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
     tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
     veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
     commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
     velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
     cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
     est laborum.
   &lt;/Modal&gt;
 );
};
```

This has a custom hook, `useGlobalModalContext`, that provides store object from where you can access all the props and the functions `showModal` and `hideModal`. You can close the modal by using the `hideModal` function.

To delete a modal, create a file called **DeleteModal.tsx**:


```
import React from "react";
import { Modal, ModalVariant, Button } from "@patternfly/react-core";
import { useGlobalModalContext } from "../GlobalModal";

export const DeleteModal = () =&gt; {
 const { hideModal } = useGlobalModalContext();

 const handleModalToggle = () =&gt; {
   hideModal();
 };

 return (
   &lt;Modal
     variant={ModalVariant.medium}
     title="Delete Modal"
     isOpen={true}
     onClose={handleModalToggle}
     actions={[
       &lt;Button key="confirm" variant="primary" onClick={handleModalToggle}&gt;
         Confirm
       &lt;/Button&gt;,
       &lt;Button key="cancel" variant="link" onClick={handleModalToggle}&gt;
         Cancel
       &lt;/Button&gt;
     ]}
   &gt;
     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
     tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
     veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
     commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
     velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
     cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
     est laborum.
   &lt;/Modal&gt;
 );
};
```

To update a modal, create a file called **UpdateModal.tsx** and add this code:


```
import React from "react";
import { Modal, ModalVariant, Button } from "@patternfly/react-core";
import { useGlobalModalContext } from "../GlobalModal";

export const UpdateModal = () =&gt; {
 const { hideModal } = useGlobalModalContext();

 const handleModalToggle = () =&gt; {
   hideModal();
 };

 return (
   &lt;Modal
     variant={ModalVariant.medium}
     title="Update Modal"
     isOpen={true}
     onClose={handleModalToggle}
     actions={[
       &lt;Button key="confirm" variant="primary" onClick={handleModalToggle}&gt;
         Confirm
       &lt;/Button&gt;,
       &lt;Button key="cancel" variant="link" onClick={handleModalToggle}&gt;
         Cancel
       &lt;/Button&gt;
     ]}
   &gt;
     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
     tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
     veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
     commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
     velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
     cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
     est laborum.
   &lt;/Modal&gt;
 );
};
```

#### 3\. Integrate GlobalModal into the top-level component in your application

To integrate the new modal structure you've created into your app, you just import the global modal class you've created. Here's my sample **App.tsx** file:


```
import "@patternfly/react-core/dist/styles/base.css";
import "./fonts.css";
import { GlobalModal } from "./components/GlobalModal";
import { AppLayout } from "./AppLayout";

export default function App() {
 return (
   &lt;GlobalModal&gt;
     &lt;AppLayout /&gt;
   &lt;/GlobalModal&gt;
 );
}
```

App.tsx is the top-level component in your app, but you can add another component according to your application's structure. However, make sure it is one level above where you want to access modals.

`GlobalModal` is the root-level component where all your modal components are imported and mapped with their specific `modalType`.

#### 4\. Select the modal's button from the AppLayout component

Adding a button to your modal with **AppLayout.js**:


```
import React from "react";
import { Button, ButtonVariant } from "@patternfly/react-core";
import { useGlobalModalContext, MODAL_TYPES } from "./components/GlobalModal";

export const AppLayout = () =&gt; {
 const { showModal } = useGlobalModalContext();

 const createModal = () =&gt; {
   showModal(MODAL_TYPES.CREATE_MODAL, {
     title: "Create instance form",
     confirmBtn: "Save"
   });
 };

 const deleteModal = () =&gt; {
   showModal(MODAL_TYPES.DELETE_MODAL);
 };

 const updateModal = () =&gt; {
   showModal(MODAL_TYPES.UPDATE_MODAL);
 };

 return (
   &lt;&gt;
     &lt;Button variant={ButtonVariant.primary} onClick={createModal}&gt;
       Create Modal
     &lt;/Button&gt;
     &lt;br /&gt;
     &lt;br /&gt;
     &lt;Button variant={ButtonVariant.primary} onClick={deleteModal}&gt;
       Delete Modal
     &lt;/Button&gt;
     &lt;br /&gt;
     &lt;br /&gt;
     &lt;Button variant={ButtonVariant.primary} onClick={updateModal}&gt;
       Update Modal
     &lt;/Button&gt;
   &lt;/&gt;
 );
};
```

There are three buttons in the AppLayout component: create modal, delete modal, and update modal. Each modal is mapped with the corresponding `modalType`: `CREATE_MODAL`, `DELETE_MODAL`, or `UPDATE_MODAL`.

### Use global dialogs

Global modals are a clean and efficient way to handle dialogs in React. They are also easier to maintain in the long run. The next time you set up a project, keep these tips in mind.

If you'd like to see the code in action, I've included the [complete application][4] I created for this article in a sandbox.

Leslie Hinson sits down with Andrés Galante, an expert HTML and CSS coder who travels the world...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/global-modals-react

作者：[Ajay Pratap][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ajaypratap
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://reactjs.org/
[3]: https://www.patternfly.org/v4/
[4]: https://codesandbox.io/s/affectionate-pine-gib74

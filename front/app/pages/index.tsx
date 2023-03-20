import Head from 'next/head'
import styles from '@/styles/Home.module.css'
import React, { FC } from "react";
import { GetStaticProps } from "next";

type Item = {
  id: number;
  name: string;
  created_at: string;
}
type Props = {
  items: Item[];
}

const Home: FC<Props> = (props) => {
  return (
    <>
      <Head>
        <title>Asset Manager</title>
        <meta name="description" content="アセット管理ツール" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <main className={styles.main}>
        <div>
          <h2>
            アイテム一覧
          </h2>
          {props.items.map((item:Item) =>
            <div className={styles.card}>
              <div>{item.name}</div>
              <div>{item.created_at}</div>
            </div>
          )}
        </div>
      </main>
    </>
  )
}

export const getStaticProps: GetStaticProps = async () => {
  const response = await fetch("http://api:3000/items", { method: "GET" });
  const json = await response.json();
  return {
    props: {
      items: json
    },
  };
}

export default Home;

<?php

namespace App\Repository;

use App\Entity\Transactions;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Transactions>
 *
 * @method Transactions|null find($id, $lockMode = null, $lockVersion = null)
 * @method Transactions|null findOneBy(array $criteria, array $orderBy = null)
 * @method Transactions[]    findAll()
 * @method Transactions[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TransactionsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Transactions::class);
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function add(Transactions $entity, bool $flush = true): void
    {
        $this->_em->persist($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(Transactions $entity, bool $flush = true): void
    {
        $this->_em->remove($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    public function sortTransactions(string $date_start, string $date_finish, string $sname): array
    {
        $entityManager = $this->getEntityManager();
        if($sname != "allserv") {
            $query = $entityManager->createQuery(
                'SELECT p
            FROM App\Entity\Transactions p
            WHERE p.transdate >= :date_start AND p.transdate <= :date_finish AND p.service = :sname'
            );
            $query->setParameters(array(
                'date_start' => $date_start,
                'date_finish' => $date_finish,
                'sname' => $sname,));
        }
        else {
            $query = $entityManager->createQuery(
                'SELECT p
            FROM App\Entity\Transactions p
            WHERE p.transdate >= :date_start AND p.transdate <= :date_finish'
            );
            $query->setParameters(array(
                'date_start' => $date_start,
                'date_finish' => $date_finish,));
        }

        return $query->getResult();
    }

    // /**
    //  * @return Transactions[] Returns an array of Transactions objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('t.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Transactions
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
